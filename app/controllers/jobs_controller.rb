class JobsController < ApplicationController
  # before_filter :require_no_user, :only => [:index]
   before_filter :require_user, :only => [:new, :edit, :update, :destroy, :apply, :detail]
   

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
    @jobs = Job.find(:all)
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

  # GET /jobs/new
  # GET /jobs/new.xml
  def new
    @job = Job.new
    @skills = Skill.find(:all)
   
      respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.xml
  def create
    
    @job = Job.new(params[:job])
    @job.user_id = current_user.id
    if @job.start_date > @job.end_date
      @job.errors.add :end_date, "should be greater than start date"
    end
    respond_to do |format|
      if @job.errors.empty? && @job.save
        format.html { redirect_to(@job, :notice => 'Job was successfully created.') }
        format.xml  { render :xml => @job, :status => :created, :location => @job }
      else
        @skills = Skill.all
        format.html { render :action => "new" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.xml
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

  # DELETE /jobs/1
  # DELETE /jobs/1.xml
  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to(jobs_url) }
      format.xml  { head :ok }
    end
  end

 
end
