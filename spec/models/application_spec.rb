require 'spec_helper'

describe Application do
  before(:each) do
    @valid_attributes = {
      :comment => "value for comment",
      :url => "value for url"
    }
  end

  it "should create a new instance given valid attributes" do
    Application.create!(@valid_attributes)
  end
end
