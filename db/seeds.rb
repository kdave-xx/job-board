# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

users  = User.create(:login => "admin", :email => "admin@fourthmedia.co.uk", :password => "123123", :password_confirmation => "123123", :is_admin => true)
users  = User.create(:login => "kalpesh", :email => "kdave@fourthmedia.co.uk", :password => "123123", :password_confirmation => "123123", :is_admin => false)
users  = User.create(:login => "mukesh", :email => "mbhati@fourthmedia.co.uk", :password => "123123", :password_confirmation => "123123", :is_admin => false)
users  = User.create(:login => "arun", :email => "arun@fourthmedia.co.uk", :password => "123123", :password_confirmation => "123123", :is_admin => false)
users  = User.create(:login => "pankaj", :email => "pankaj@fourthmedia.co.uk", :password => "123123", :password_confirmation => "123123", :is_admin => false)
users  = User.create(:login => "gauttam", :email => "gauttam@fourthmedia.co.uk", :password => "123123", :password_confirmation => "123123", :is_admin => false)
users  = User.create(:login => "paul", :email => "paul@fourthmedia.co.uk", :password => "123123", :password_confirmation => "123123", :is_admin => false)

