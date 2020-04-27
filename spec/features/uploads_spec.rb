require 'rails_helper'

RSpec.feature "Uploads", type: :feature do
  background do

  end

  scenario "upload file to all uploads" do
    visit new_upload_path
    find("All Uploads").click
    expect(page.current_path).to eql(uploads_path)
  end

  scenario "all uploads to upload file" do
    visit uploads_path
    find("New Upload").click
    expect(page.current_path).to eql(new_upload_path)
  end

  scenario "Upload file successfully" do
    visit new_upload_path
    find("Choose File").click
    attach_file("file", Rails.root + 'spec/fixtures/abc.text')
    find("Upload file").click
    expect(page.current_path).to eql(uploads_path)
  end

end
