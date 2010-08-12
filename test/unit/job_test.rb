require 'test_helper'

class JobTest < ActiveSupport::TestCase
  should belong_to :country
  should belong_to :currency
  should belong_to :type
  should belong_to :rate
  should have_and_belong_to_many :skills

  should validate_presence_of :title
  should validate_presence_of :city
  should validate_presence_of :start_date
  should validate_presence_of :end_date
end
