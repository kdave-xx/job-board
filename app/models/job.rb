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

  validates_presence_of :title
  validates_presence_of :city
  validates_presence_of :start_date
  validates_presence_of :end_date

 
end
