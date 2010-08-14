require 'spec_helper'

describe UserSessionsController do

  #Delete this example and add some real ones
  it "should use UserSessionsController" do
    controller.should be_an_instance_of(UserSessionsController)
  end

  describe "GET 'new'" do
    it "should get new page" do
      get 'new'
      response.should be_success
    end
  end

 
#  describe "responding to POST create" do
#    describe "specified by login name" do
#      before(:each) do
#        Factory.create(:valid_user)
#      end
#
#        it "should log in the correct user" do
#          post :create, :user_session => {:login => "mathieu", :password => 'mathieu'}
#          should respond_with :success
#          should set_the_flash.to("Login successful!")
#        end
#      end
#  end
#
#  describe "should destroy login session" do
#    before(:each) do
#      activate_authlogic
#      UserSession.create Factory.build(:valid_user)
#    end
#
#    it "should destroy the current user" do
#      delete :destroy
#    end
#  end
end
