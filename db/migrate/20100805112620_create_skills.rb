class CreateSkills < ActiveRecord::Migration
  def self.up
    create_table :skills do |t|
      t.string :name
      t.timestamps
    end
    Skill.create :name => "Unix"
    Skill.create :name => "Java"
    Skill.create :name => "TeamSite"
    Skill.create :name => "LiveSite"
    Skill.create :name => "SQL"
    Skill.create :name => "XML"
    Skill.create :name => "XSL"
    Skill.create :name => "Windows"
    Skill.create :name => "Architecture"
    Skill.create :name => "Project Management"
    Skill.create :name => "Account Management"
    Skill.create :name => "Virage MediaBin"
    Skill.create :name => "OpenDeploy"
    Skill.create :name => "MetaTagger"
    Skill.create :name => "IDOL"
  end

  def self.down
    drop_table :skills
  end
end
