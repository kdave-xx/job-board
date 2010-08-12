require 'spec_helper'

describe Country do
  before(:each) do
    @valid_attributes = { :name => "India"
      
    }
  end

  it "should create a new instance given valid attributes" do
    Country.create!(@valid_attributes)
  end

  it {should have_many :job}
end
