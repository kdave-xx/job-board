class CreateApplications < ActiveRecord::Migration
  def self.up
    create_table :applications do |t|
      t.references :job
      t.references :user
      t.text :comment
      t.string :url
      t.string :email
      t.boolean :award, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :applications
  end
end
