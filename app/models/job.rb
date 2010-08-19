class Job < ActiveRecord::Base
  acts_as_solr

  belongs_to :user
  belongs_to :country
  belongs_to :currency
  belongs_to :type
  belongs_to :rate
  has_and_belongs_to_many :skills
  has_many :applications
  has_many :applicants, :through => "application"

  validates_presence_of :title, :city, :start_date, :end_date
  validates_format_of :title, :with => /^[A-Za-z0-9\s&.-]+$/, :unless => Proc.new{|u| u.attributes['title'].blank?}
  validates_format_of :city, :with => /^[A-Za-z0-9\s]+$/, :unless => Proc.new{|u| u.attributes['city'].blank?}
  validate :valid_date
  
  def valid_date
    errors.add(:end_date, "must be greater than start date or equal to start date") if "#{end_date}" < "#{start_date}"
  end
 
end
