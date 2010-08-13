class Mailer < ActionMailer::Base

   def application_instructions(applicantion)
    subject       "Job Board Application Instructions"
    from          "no-reply@fourthmedia.co.uk"
    recipients    applicantion.email
    sent_on       Time.now
    @content_type = "text/html"
#    body          :email                  => user.email
#    body          :account_activation_url => register_url(user.perishable_token)
#    @body[:an_url] = register_url(user.perishable_token)
#    @body[:application] = application
  end

   def password_reset_instructions(user)
    subject      "Password Reset Instructions"
    from         "no-replayfourthmedia.co.uk"
    recipients    user.email
    content_type "text/html"
    sent_on      Time.now
    body         :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end


end
