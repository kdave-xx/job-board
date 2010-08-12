require 'spec_helper'

describe "/applications/show.html.erb" do
  include ApplicationsHelper
  before(:each) do
    assigns[:application] = @application = stub_model(Application,
      :comment => "value for comment",
      :url => "value for url"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ comment/)
    response.should have_text(/value\ for\ url/)
  end
end
