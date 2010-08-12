require 'spec_helper'

describe "/applications/index.html.erb" do
  include ApplicationsHelper

  before(:each) do
    assigns[:applications] = [
      stub_model(Application,
        :comment => "value for comment",
        :url => "value for url"
      ),
      stub_model(Application,
        :comment => "value for comment",
        :url => "value for url"
      )
    ]
  end

  it "renders a list of applications" do
    render
    response.should have_tag("tr>td", "value for comment".to_s, 2)
    response.should have_tag("tr>td", "value for url".to_s, 2)
  end
end
