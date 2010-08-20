class JobsController < ApplicationController
  # before_filter :require_no_user, :only => [:index]
   before_filter :require_user, :only => [:new, :edit, :update, :destroy, :apply, :detail, :jobaward]
   

  def index
    if current_user
      @jobs = Job.all - Job.find_all_by_user_id(current_user)
    else
         @jobs = Job.find(:all)
    end
    change_state(@jobs)
    @jobs = @jobs.paginate :page => params[:page], :per_page => 10
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jobs }
    end
  end

 
  def myjobs
    @jobs = Job.find_all_by_user_id(current_user)
    @jobs = @jobs.paginate :page => params[:page], :per_page => 10
  end

  def show
    @job = Job.find(params[:id])
   
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job }
    end
  end

  def detail
    @job = Job.find(params[:id])
    @applicants = @job.applications.find(:all)
  end

 
  def new
    @job = Job.new
    @skills = Skill.find(:all)
   
      respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job }
    end
  end

  
  def edit
    @job = Job.find(params[:id])
  end

 
  def create
    
    @job = Job.new(params[:job])
    @job.user_id = current_user.id
    respond_to do |format|
      if @job.save
        format.html { redirect_to(@job, :notice => 'Job was successfully created.') }
        format.xml  { render :xml => @job, :status => :created, :location => @job }
      else
        @skills = Skill.all
        format.html { render :action => "new" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def update
    @job = Job.find(params[:id])

   
    respond_to do |format|
      if @job.update_attributes(params[:job])

        format.html { redirect_to(@job, :notice => 'Job was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to(jobs_url, :notice => 'Job was successfully deleted.') }
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
    if count>0
    Application.deliver_applications_rejection_instructions!(@applications, @job)
    end
  end

 
end
