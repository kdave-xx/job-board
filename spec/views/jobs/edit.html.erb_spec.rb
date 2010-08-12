require 'spec_helper'

describe "/jobs/edit.html.erb" do
  include JobsHelper

  before(:each) do
    assigns[:job] = @job = stub_model(Job,
      :new_record? => false
    )
  end

  it "renders the edit job form" do
    render

    response.should have_tag("form[action=#{job_path(@job)}][method=post]") do
    end
  end
end
