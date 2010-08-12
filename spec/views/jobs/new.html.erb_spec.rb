require 'spec_helper'

describe "/jobs/new.html.erb" do
  include JobsHelper

  before(:each) do
    assigns[:job] = stub_model(Job,
      :new_record? => true
    )
  end

  it "renders new job form" do
    render

    response.should have_tag("form[action=?][method=post]", jobs_path) do
    end
  end
end
