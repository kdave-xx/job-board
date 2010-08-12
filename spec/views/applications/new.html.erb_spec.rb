require 'spec_helper'

describe "/applications/new.html.erb" do
  include ApplicationsHelper

  before(:each) do
    assigns[:application] = stub_model(Application,
      :new_record? => true,
      :comment => "value for comment",
      :url => "value for url"
    )
  end

  it "renders new application form" do
    render

    response.should have_tag("form[action=?][method=post]", applications_path) do
      with_tag("textarea#application_comment[name=?]", "application[comment]")
      with_tag("input#application_url[name=?]", "application[url]")
    end
  end
end
