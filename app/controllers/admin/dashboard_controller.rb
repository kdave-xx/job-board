class Admin::DashboardController < ApplicationController
  before_filter :require_admin_user
  layout 'admin'
 
  def index
    unless params[:search].blank?
      @dashboards = Job.find_by_solr(params[:search]).docs
    else
      @dashboards = Job.find(:all)
    end
     change_state(@dashboards)
     @dashboards =  @dashboards.paginate :page => params[:page], :per_page => 10
  end

  def show
     @dashboard = Job.find(params[:id])
     @applicants = @dashboard.applications.find(:all)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml =>  @dashboard }
    end
  end

   def edit
    @job = Job.find(params[:id])
  end

    def update
    @job = Job.find(params[:id])
#    raise @job.inspect
    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to(admin_dashboard_index_path, :notice => 'Dashboard was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dashboard.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @dashboard = Job.find(params[:id])
    @dashboard.destroy

    respond_to do |format|
      format.html { redirect_to(admin_dashboard_index_url, :notice => 'Job was successfully deleted.') }
      format.xml  { head :ok }
    end
  end

  def jobaward
    @application = Application.find_by_id(params[:id])
    @job = Job.find_by_id(@application.job_id)
     Application.transaction do
          @application.update_attribute(:award, true)
    end
    @applications = @job.applications.all - Application.find_all_by_award(true)
    count = @applications.count
    @application.deliver_application_selection_instructions!
    @application.deliver_jobowner_selectapplicant_instructions!
    if count>0
    Application.deliver_applications_rejection_instructions!(@applications, @job)
    end
  end
end
