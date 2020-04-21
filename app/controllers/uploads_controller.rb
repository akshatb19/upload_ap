class UploadsController < ApplicationController
  def new
  end

  def create
    s3 = Aws::S3::Resource.new(region: 'us-east-2')
    obj = s3.bucket(ENV['S3_BUCKET']).object(params[:file].original_filename)
    obj.upload_file(params[:file])
    bucketlink = s3.bucket(ENV['S3_BUCKET']).object(obj.key).presigned_url(:get, expires_in: 3600, response_content_disposition: 'attachment')
    @upload = Upload.new(
    		url: obj.public_url,
		name: obj.key
    	)
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
