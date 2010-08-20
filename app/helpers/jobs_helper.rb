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

  def sort_link(title, column, options = {})
    condition = options[:unless] if options.has_key?(:unless)
    sort_dir = params[:d] == 'up' ? 'down' : 'up'
    link_to_unless condition, title, request.parameters.merge( {:c => column, :d => sort_dir} )
  end

 


end
