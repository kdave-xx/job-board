require 'spec_helper'

describe User do
  before(:each) do
    @valid_user = {:login => "kalpesh", :email => "kdave@fourthmedia.co.uk", :password => "123123", :password_confirmation => "123123"}
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

  it {should validate_format_of(:email).with('/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i')}

  describe "A User" do
    before(:each) do
      @user = Factory(:valid_user)
    end

    describe "Delivering password instructions" do
      before(:each) do
        @user.deliver_password_reset_instructions!
      end

      it "should change perishable token" do
        @user.perishable_token
      end

      it "should send an email" do
#        Mailer.deliver_password_reset_instructions(@user)
      end
    end
  end

  describe "A User" do
    before(:each) do
      @user = Factory(:valid_user)
    end
  end

#  context "A user" do
#    setup { @user = Factory(:user) }
#
#    context "Delivering password instructions" do
#      setup { @user.deliver_password_reset_instructions! }
#
#      should_change("perishable token") { @user.perishable_token }
#       should "send an email" do
#        assert_sent_email
#      end
#    end
#  end

end
