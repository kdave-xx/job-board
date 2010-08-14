require 'spec_helper'

describe PasswordResetsController do
   describe "routing" do
      it "recognizes and generates #index" do
      { :get => "/jobs" }.should route_to(:controller => "jobs", :action => "index")
    end
   end
end