require 'spec_helper'

describe User do
  before(:each) do
    @valid_user = {:login => "test", :email => "test@test.com", :password => "password", :password_confirmation => "password"}
    @user = User.new(@valid_user)
  end
#
#  it "should create a new instance given valid attributes" do
#    User.create!(@valid_attributes)
#  end

  it "should succeed creating a new :valid_user from the Factory" do
    @user.should be_valid
    @user.save!
  end

  it "should not be valid without login name" do
    @user.login = ""
    @user.should_not be_valid
  end

  it "should invalid :invalid_user factory" do
    @user.password = "password"
    @user.password_confirmation = "incorrect email"
    @user.should_not be_valid
  end

  it "should not be a valid user without email" do
    @user.email = ""
    @user.should_not be_valid
  end

  it "should not be a valid user with invalid format of email" do
    @user.email = "test"
    @user.should_not be_valid
  end

  it {should have_many :jobs}

 

  it {should validate_presence_of :login}

  it {should validate_presence_of :email}

  it {should validate_presence_of :password}

  it {should validate_format_of(:email).with('/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i')}
end
