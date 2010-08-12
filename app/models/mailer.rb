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

end
