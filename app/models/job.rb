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
  validates_format_of :title, :with => /[A-Za-z0-9]+/, :on => :create
   
end
