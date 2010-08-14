require 'spec_helper'

describe Mailer do

  describe "delivering password reset instructions" do
   before(:each) do
    @user = Factory(:valid_user)
    @user.deliver_password_reset_instructions!
   end
   
    it "should send an email" do
       Mailer.deliver_password_reset_instructions(@user) do |email|
        email.subject =~ /Password Reset Instructions/
        email.body =~ /#{@user.perishable_token}/
        email.body =~ /Password Reset Instructions/
       end
    end
  end

  describe "delivering application instructions for job" do
    before(:each) do
      @application = Factory(:applicant)
      @application.deliver_application_instructions!
    end

    it "should send an mail" do
       Mailer.deliver_application_instructions(@application) do |email|
        email.subject =~ /Job Board Application Instructions/
       end
    end
  end
  

end