require 'spec_helper'

describe UserSessionsController do

  describe "GET 'new'" do
    before(:each) do
      activate_authlogic
      @user_session = Factory.build(:valid_user)
      UserSession.stubs(:new).returns(@user_session)
      get :new
    end

    it {should assign_to :user_session}
    it {should respond_with :success}
    it {should render_template :new}
    it {should render_with_layout :application}
    it {should_not set_the_flash}
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
