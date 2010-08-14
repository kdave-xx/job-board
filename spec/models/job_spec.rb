require 'spec_helper'

describe Job do
  before(:each) do
    @valid_attributes = { :title => "Programmer", :city => "Delhi", :start_date => "2010-2-5", :end_date => "2010-5-5"  }
    @job = Job.new(@valid_attributes)
  end

  it "should create a new instance given valid attributes" do
    @job.should be_valid
    @job.save!
  end

  it "should not be valid without title" do
    @job.title = ""
    @job.should_not be_valid
  end

  it "should not be valid without city" do
    @job.city = ""
    @job.should_not be_valid
  end

  it "should not be valid without choosing a start_date" do
    @job.start_date = ""
    @job.should_not be_valid
  end

  it "should not be valid without choosing a end_date" do
    @job.end_date = ""
    @job.should_not be_valid
  end

  it {should belong_to :country}
  it {should belong_to :currency}
  it {should belong_to :type}
  it {should belong_to :rate}
  it {should have_and_belong_to_many :skills}

  it {should validate_presence_of :title}
  it {should validate_presence_of :city}
  it {should validate_presence_of :start_date}
  it {should validate_presence_of :end_date}
  it {should validate_format_of(:title).with('/[A-Za-z0-9]+/')}

end
