class User < ActiveRecord::Base
  acts_as_authentic

  has_many :jobs

  validates_presence_of :login, :email, :password
  validates_length_of :login, :within => 6..32
  validates_length_of :password, :maximum => 32
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_format_of :login, :with => /[A-Za-z0-9]+/, :on => :create
  def is_admin?
    return is_admin
  end

   def deliver_password_reset_instructions!
    reset_perishable_token!
    Mailer.deliver_password_reset_instructions(self)
  end

end
