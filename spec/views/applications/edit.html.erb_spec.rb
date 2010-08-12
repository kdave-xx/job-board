require 'spec_helper'

describe "/applications/edit.html.erb" do
  include ApplicationsHelper

  before(:each) do
    assigns[:application] = @application = stub_model(Application,
      :new_record? => false,
      :comment => "value for comment",
      :url => "value for url"
    )
  end

  it "renders the edit application form" do
    render

    response.should have_tag("form[action=#{application_path(@application)}][method=post]") do
      with_tag('textarea#application_comment[name=?]', "application[comment]")
      with_tag('input#application_url[name=?]', "application[url]")
    end
  end
end
