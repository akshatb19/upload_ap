require 'rails_helper'

RSpec.describe UploadsController, type: :controller do
  before(:each) do
    @upload = FactoryBot.create(:upload)
  end

  it 'GET index' do
    get :index
    expect(response).to render_template :index
  end

  it 'GET #new' do
    get :new
    expect(response).to render_template :new
  end

  let(:file) { FactoryBot.create(:abc_txt) }

  it 'should upload file and redirect to index' do
    Upload.any_instance.stubs(:valid?).returns(true)
    post :create, :params =>{:file => file}
    flash[:notice].should be_nil
    expect(response).to redirect_to('http://test.host/uploads')
  end

  it 'should not save and redirect to new' do
    Upload.any_instance.stubs(:valid?).returns(false)
    post :create, :params =>{:file => file}
    flash[:notice].should_not be_nil
    expect(response).to render_template :new
  end

  it 'should delete file' do
    delete :destroy, :params =>{:id => 63}
    expect(response).to redirect_to('http://test.host/uploads')
  end

  context 'send email' do

    before(:all) do
      @email = NotifierMailer.new_request("xyz")
    end

    it "should be set to be delivered to the email passed in" do
      expect(@email).to deliver_to(["test1@gmail.com","test1@gmail.com"])
    end

    it "should be sent from given id" do
      expect(@email).to deliver_from("notification@example.com")
    end

    it "should have the correct subject" do
      expect(@email).to have_subject("New File")
    end

  end

end
