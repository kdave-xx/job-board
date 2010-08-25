module JobsHelper
  def skill(s)
      if @job
         @job.skills.include?(s)
      else
        false
      end
   end

  def admin_user?
     return current_user && current_user.is_admin?
  end

end
