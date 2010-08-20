class Mailer < ActionMailer::Base

   def application_instructions(application)
    subject       "Job Board Application Instructions"
    from          "no-reply@fourthmedia.co.uk"
    recipients    application.email
    sent_on       Time.now
    @content_type = "text/html"
    body          :applicant => application

  end

   def jobowner_instructions(application)
    subject       "Job Board Application Instructions"
    from          "no-reply@fourthmedia.co.uk"
    recipients    application.job.user.email
    sent_on       Time.now
    @content_type = "text/html"
    body          :applicant => application

  end

   def password_reset_instructions(user)
    subject      "Password Reset Instructions"
    from         "no-replayfourthmedia.co.uk"
    recipients    user.email
    content_type "text/html"
    sent_on      Time.now
    body        :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end

   def application_selection_instructions(application)
    subject       "Job Board Application Selection Instructions"
    from          "no-reply@fourthmedia.co.uk"
    recipients    application.email
    sent_on       Time.now
    @content_type = "text/html"
    body          :applicant => application
   end

   def jobowner_selectapplicant_instructions(application)
    subject       "Job Board Application Selection Instructions"
    from          "no-reply@fourthmedia.co.uk"
    recipients    application.job.user.email
    sent_on       Time.now
    @content_type = "text/html"
    body          :applicant => application
   end

   def applications_rejection_instructions(applications, job)
    subject       "Job Board Application Selection Instructions"
    from          "no-reply@fourthmedia.co.uk"
    recipients    get_recipients(applications)
    sent_on       Time.now
    @content_type = "text/html"
    body          :job => job
   end

   private

   def get_recipients(applications)
     applications.collect(&:email).join(",")
   end

end
