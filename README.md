# README
Upload Application:
This is an Upload Application which uploads any kind of file to an AWS S3 bucket. It generates pre-signed URL valid for 6 hours and send it to the given set of email ids.

Steps for Installation
  1. Clone or download using https://github.com/akshatb19/upload_app.git
  2. Open command prompt in upload_app folder
  3. Run in command prompt: bundle install

Steps to run server locally:
  1. Open command prompt in upload_app folder
  2. Run in command prompt: rails s or 'rails server

Steps to run unit tests:
  1. Open command prompt in upload_app folder
  2. Run in command prompt: bundle exec rspec spec/controllers/uploads_controller_spec.rb

Steps to run integration tests:
1. Open command prompt in upload_app folder
2. Run in command prompt: bundle exec rspec spec/features/uploads_spec.rb
