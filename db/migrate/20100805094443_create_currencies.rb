class CreateCurrencies < ActiveRecord::Migration
  def self.up
    create_table :currencies do |t|
      t.string :name
      t.timestamps
    end
    Currency.create :name => "Afghani - Afghanistan"
    Currency.create :name => "Argentino - Argentina"
    Currency.create :name => "Austral - Argentina"
    Currency.create :name => "Cedi - Ghana"
    Currency.create :name => "Chervonets - Russia"
    Currency.create :name => "Denier - France"
    Currency.create :name => "United States dollar"
    Currency.create :name => "Irish pound - Ireland"
    Currency.create :name => "Indian rupeeIndian-India"
    Currency.create :name => "Pound"
    Currency.create :name => "Real"
  end

  def self.down
    drop_table :currencies
  end
end
