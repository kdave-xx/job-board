require 'spec_helper'

describe "/jobs/show.html.erb" do
  include JobsHelper
  before(:each) do
    assigns[:job] = @job = stub_model(Job)
  end

  it "renders attributes in <p>" do
    render
  end
end
