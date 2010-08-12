class CreateRates < ActiveRecord::Migration
  def self.up
    create_table :rates do |t|
      t.string :name
      t.timestamps
    end
    Rate.create :name => "Upto 10,000"
    Rate.create :name => "Upto 20,000"
    Rate.create :name => "Upto 30,000"
  end

  def self.down
    drop_table :rates
  end
end
