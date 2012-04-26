# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

puts 'SETTING UP USER LOGINS'
[
  {
    :email => 'daren.sdw@gmail.com', 
    :password => 'Cup4te4s',
    :password_confirmation => 'Cup4te4s',
    :admin => true
  },
  {
    :email => 'mark@blackdogproperty.com', 
    :password => 'Abergavenny46',
    :password_confirmation => 'Abergavenny46',
    :admin => true
  }
].each do |u|
  User.create(u)
end
puts 'All users created'