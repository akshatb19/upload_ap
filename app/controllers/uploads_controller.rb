class UploadsController < ApplicationController
  def new
  end

  def create
    # Make an object in your bucket for your upload
    obj = S3_BUCKET.objects[params[:file].original_filename]
   
    # Upload the file
    obj.write(
      file: params[:file],
      acl: :public_read
    )

    # Create an object for the upload
    @upload = Upload.new(
    		url: obj.public_url,
		name: obj.key
    	)
    s3 = Aws::S3::Resource.new(region: 'us-east-2')
    bucketlink = s3.bucket(ENV['S3_BUCKET']).object(obj.key).presigned_url(:get, expires_in: 3600, response_content_disposition: 'attachment')
    # Save the upload
    if @upload.save
      NotifierMailer.new_request(bucketlink).deliver_now
      redirect_to uploads_path, success: 'File successfully uploaded'
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
  end

  def index
	@uploads = Upload.all
  end
  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
 
    redirect_to uploads_path
  end
end