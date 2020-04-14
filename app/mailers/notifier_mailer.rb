class NotifierMailer < ApplicationMailer
  default to: "test1@gmail.com, test1@gmail.com",
          from: 'notification@example.com'
  def new_request(bucketlink)
    @bucketlink = bucketlink
    mail(
      subject: "New File",
      content_type: "text/html"
    )
  end
end
