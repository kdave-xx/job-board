class Admin::DashboardController < ApplicationController
  before_filter :require_admin_user
  layout 'admin'
 
  def index
    unless params[:search].blank?
      @dashboards = Job.find_by_solr(params[:search]).docs
    else
      @dashboards = Job.find(:all)
    end
   
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
    @dashboard = Job.find(params[:id])
  end

    def update
    @job = Job.find(params[:id])
#    raise @job.inspect
    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to(admin_dashboard_index_path, :notice => 'Dashboardb was successfully updated.') }
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
      format.html { redirect_to(admin_dashboard_index_url) }
      format.xml  { head :ok }
    end
  end
end
