require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  should have_and_belong_to_many :jobs
end
