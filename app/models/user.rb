class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.validate_login_field = false
    c.validate_email_field = false
  end

  has_many :jobs

  validates_presence_of :login, :email
  validates_uniqueness_of :login, :unless => Proc.new{|u| u.attributes['login'].blank?}
  validates_uniqueness_of :email, :unless => Proc.new{|u| u.attributes['email'].blank?}
  validates_length_of :login, :within => 6..32, :unless => Proc.new{|u| u.attributes['login'].blank?}
  validates_length_of :email, :within => 6..50, :unless => Proc.new{|u| u.attributes['email'].blank?}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :unless => Proc.new{|u| u.attributes['email'].blank?}
  validates_format_of :login, :with => /[A-Za-z0-9]+/, :unless => Proc.new{|u| u.attributes['login'].blank?}
  merge_validates_length_of_password_field_options :with => 6..32
 
  
  def is_admin?
    return is_admin
  end

   def deliver_password_reset_instructions!
    reset_perishable_token!
    Mailer.deliver_password_reset_instructions(self)
  end

end
