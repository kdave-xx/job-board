class Application < ActiveRecord::Base
  belongs_to :applicant, :class_name => "User"
  belongs_to :job

  has_attached_file :data,
                  :url  => "/data/applications/:id/:basename.:extension",
                  :path => ":rails_root/public/data/applications/:id/:basename.:extension"

  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 5.megabytes
  validates_attachment_content_type :data, :content_type => ['application/pdf', 'text/plain']

   def deliver_application_instructions!
     Mailer.deliver_application_instructions(self)
   end
end