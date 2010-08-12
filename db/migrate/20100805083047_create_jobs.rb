class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.integer :country_id
      t.string :city
      t.integer :type_id
      t.integer :currency_id
      t.integer :rate_id
      t.date :start_date
      t.date :end_date
      t.integer :skill_ids
      t.boolean :status, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
