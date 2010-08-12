class Country < ActiveRecord::Base
  NAMES = self.find(:all, :order => :name).map do |t|
    [t.name, t.id]
  end
  has_many :job
end
