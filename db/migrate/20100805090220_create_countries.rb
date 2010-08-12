class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :name

      t.timestamps
    end
    Country.create :name => "Afghanistan"
    Country.create :name => "Albania"
    Country.create :name => "Algeria"
    Country.create :name => "Argentina"
    Country.create :name => "Australia"
    Country.create :name => "Austria"
    Country.create :name => "Bangladesh"
    Country.create :name => "Belgium"
    Country.create :name => "Bhutan"
    Country.create :name => "Brazil"
    Country.create :name => "Barma"
    Country.create :name => "Cambodia"
    Country.create :name => "Canada"
    Country.create :name => "China"
    Country.create :name => "Colombia"
    Country.create :name => "Cuba"
    Country.create :name => "Denmark"
    Country.create :name => "Egypt"
    Country.create :name => "Finland"
    Country.create :name => "France"
    Country.create :name => "Germany"
    Country.create :name => "Hong Kong"
    Country.create :name => "Iceland"
    Country.create :name => "India"
    Country.create :name => "Indonesia"
    Country.create :name => "Ireland"
    Country.create :name => "Italy"
    Country.create :name => "Japan"
  end

  def self.down
    drop_table :countries
  end
end
