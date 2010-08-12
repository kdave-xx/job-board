class Skill < ActiveRecord::Base
  NAMES = self.find(:all, :order => :name).map do |t|
    [t.name, t.id]
  end
  has_and_belongs_to_many :jobs
end
