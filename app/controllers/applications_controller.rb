class ApplicationsController < ApplicationController
 before_filter :require_user, :only => [:new, :create]
  
  
  def new
     @application = Application.new
     @job = Job.find(params[:id])
     
      respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @application }
    end
  end

  def create
   
    @application = Application.new(params[:application])
    @application.user_id = current_user.id
    
    respond_to do |format|
      if @application.save
         @application.deliver_application_instructions!
        format.html { redirect_to(@application, :notice => 'Application was successfully created.') }
        format.xml  { render :xml => @application, :status => :created, :location => @application }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @application.errors, :status => :unprocessable_entity }
      end
    end
  end
  
#  def destroy
#    @application = Application.find(params[:id])
#    @application.destroy
#
#    respond_to do |format|
#      format.html { redirect_to(applications_url) }
#      format.xml  { head :ok }
#    end
#  end
end
