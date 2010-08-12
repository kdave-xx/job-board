require 'spec_helper'

describe Currency do
  before(:each) do
    @valid_attributes = { :name => "Indian Rupee"  }
  end

  it "should create a new instance given valid attributes" do
    Currency.create!(@valid_attributes)
  end

  it {should have_many :jobs}
end
