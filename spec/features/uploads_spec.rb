require 'rails_helper'

RSpec.feature "Uploads", type: :feature do
  background do

  end

  scenario "upload file to all uploads" do
    visit new_upload_path
    find('a[href$="/uploads"]').click
    expect(page.current_path).to eql(uploads_path)
  end

  scenario "all uploads to upload file" do
    visit uploads_path
    find('a[href$="/uploads/new"]').click
    expect(page.current_path).to eql(new_upload_path)
  end

  scenario "Upload file successfully" do
    visit new_upload_path
    find("#file").click
    attach_file("file", Rails.root + 'spec/fixtures/abc.txt')
    find("input[type = 'submit']").click
    expect(page.current_path).to eql(uploads_path)
  end

  scenario "view uploaded file" do
    visit uploads_path
    find('a',text: "abc.txt").click
    expect(page.current_path).to eql("/abc.txt")
  end

  scenario "delete file" do
    visit uploads_path
    find('a[href$="/uploads/62"]').click
    expect(page).to_not have_css('a',text: "abc.txt")
  end

end
