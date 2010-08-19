require 'spec_helper'

describe PasswordResetsController do

#  it "should use PasswordResetsController" do
#    controller.should be_an_instance_of(PasswordResetsController)
#  end
#
#  describe "when not logged in" do
#    before(:each) do
#      get :new
#    end
#
#    it {should respond_with :success }
#    it {should render_template :new}
#    it {should render_with_layout :application }
#    it {should_not set_the_flash}
#  end

#  describe "on POST to :create" do
#    before(:each) do
#       post :create, :email => Factory(:valid_user).email
#       @user = User.find(params[:email])
#    end
#
#    it {should assign_to :user}
#    it {should respond_with :redirect}
##    it {should redirect_to("the index page"){jobs_path}}
#    it "should send an email" do
#     @user.deliver_password_reset_instructions!
#    end
#    it {should set_the_flash.to("Instructions to reset your password have been emailed to you")}
#  end

#  describe "on GET to :edit" do
#    before(:each) do
#       get :edit, :id => Factory(:valid_user).perishable_token
#    end
#
#    it {should assign_to :user}
#    it {should respond_with :success}
#    it {should render_template :edit}
#    it {should render_with_layout :application}
#    it {should_not set_the_flash}
#  end
#

#  describe "on PUT to :update" do
#    before(:each) do
#      @user = Factory(:valid_user)
#      put :update, :id => @user.perishable_token, :user => { :password => "newpassword" }
#    end
#
#    it {should assign_to :user}
#    it {should respond_with :redirect}
##    it {should redirect_to("the users profile"){@user}}
#    it {should set_the_flash.to("Your password was successfully updated")}
#  end

end
