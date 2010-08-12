require 'spec_helper'

describe "/jobs/index.html.erb" do
  include JobsHelper

  before(:each) do
    assigns[:jobs] = [
      stub_model(Job),
      stub_model(Job)
    ]
  end

  it "renders a list of jobs" do
    render
  end
end
