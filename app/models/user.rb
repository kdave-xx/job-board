class User < ActiveRecord::Base
  acts_as_authentic

  has_many :jobs

  validates_uniqueness_of :login, :email
  validates_presence_of :login
  validates_presence_of :email
  validates_presence_of :password

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  def is_admin?
    return is_admin
  end
 
end
