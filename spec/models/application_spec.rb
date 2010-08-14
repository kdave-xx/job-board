require 'spec_helper'

describe Application do
  before(:each) do
    @valid_attributes = {
      :comment => "value for comment",
      :url => "value for url",
      :data_file_name => "abc.pdf"
    }
  end

  it "should create a new instance given valid attributes" do
    Application.create!(@valid_attributes)
  end

#  it {should belong_to(:user)}  #.with(:class_name => "User")}
  it {should belong_to :job}

   describe "A Application" do
    before(:each) do
      @application = Factory(:applicant)
    end

    describe "Delivering password instructions" do
      before(:each) do
        @application.deliver_application_instructions!
      end

      it "should send an email" do
        Mailer.deliver_application_instructions(@application)
      end
    end
  end
end
