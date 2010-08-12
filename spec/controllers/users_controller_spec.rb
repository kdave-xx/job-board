require 'spec_helper'

describe UsersController do

  #Delete this example and add some real ones
  it "should use UsersController" do
    controller.should be_an_instance_of(UsersController)
  end

  describe "GET 'new'" do
      it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    before(:each) do
      User.stub!(:current_user).and_return(:false)
      @login_warning= "You need to be logged in to do that"
    end

    it "should be failed without login" do
      get 'edit'
      response.should_not be_success
    end
  end

  describe "GET 'show'" do
    before(:each) do
      User.stub!(:current_user).and_return(:false)
      @login_warning= "You need to be logged in to do that"
    end

    it "should be failed without login" do
      get 'show'
      response.should_not be_success
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      User.stub!(:current_user).and_return(:false)
      @login_warning= "You need to be logged in to do that"
    end

    it "should be failed without login" do
      get 'edit'
      response.should_not be_success
    end
  end



end
