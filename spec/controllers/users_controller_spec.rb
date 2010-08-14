require 'spec_helper'

describe UsersController do

  #Delete this example and add some real ones
  it "should use UsersController" do
    controller.should be_an_instance_of(UsersController)
  end

  describe "on GET to 'new'" do
    before(:each) do
      get :new
    end

    it {should assign_to :user}
    it {should respond_with :success}
    it {should render_template :new}
    it {should render_with_layout :application}
    it {should_not set_the_flash}
  end

  describe "on POST to :create" do
    before(:each) do
      @user = Factory(:valid_user)
      User.stubs(:new).returns(@user)
      post :create, :user => @user
    end

    it {should assign_to :user}
    it {should respond_with :redirect}
    it {should redirect_to("the index page"){jobs_url}}
    it {should set_the_flash.to("Successfully registered!")}
  end

  describe "on GET to :show" do
    before(:each) do
      @user = Factory(:valid_user)
      UserSession.create(:login => "kalpesh", :password => "123123")
      get :show, :id => @user.id
    end


  end

#  describe "GET 'edit'" do
#    before(:each) do
#      User.stub!(:current_user).and_return(:false)
#      @login_warning= "You need to be logged in to do that"
#    end
#
#    it "should be failed without login" do
#      get 'edit'
#      response.should_not be_success
#    end
#  end
#
#  describe "GET 'show'" do
#    before(:each) do
#      User.stub!(:current_user).and_return(:false)
#      @login_warning= "You need to be logged in to do that"
#    end
#
#    it "should be failed without login" do
#      get 'show'
#      response.should_not be_success
#    end
#  end
#
#  describe "PUT 'update'" do
#    before(:each) do
#      User.stub!(:current_user).and_return(:false)
#      @login_warning= "You need to be logged in to do that"
#    end
#
#    it "should be failed without login" do
#      get 'edit'
#      response.should_not be_success
#    end
#  end



end
