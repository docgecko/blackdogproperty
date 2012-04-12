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
    :password => 'Cup4te4',
    :password_confirmation => 'Cup4te4'
  }
].each do |u|
  User.create(u)
end
puts 'All users created'

puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)

puts 'SETTING UP TEAM MEMBERS'
[
  {
    :name => 'Mark Tovey 07540 706994',
    :image => '',
    :profile => 'With property being a stable investment in times of uncertainty, Mark\'s ability to find the right property at the right price, whilst always being mindful of a return on your investment is unrivalled.

Mark is the founder of BlackDog Property and has realised a personal dream of finding and renovating outstanding properties in the most beautiful and prestigious area\'s of Europe.

Mark is driven for success, entrepreneurial and an accomplished businessman with a strong commercial acumen. Mark demonstrates impeccable style which is apparent throughout the projects he influences.

BlackDog Property enables others to follow their dreams in confidence, drawing on the expertise of our professional team to achieve results.

Mark is a keen golfer, skier devoted dad to Hannah, Callum and of course Ted.',
    :order_no => '1',
    :published => true
  },
  {
    :name => 'Ted "Tiberius" Tovey',
    :image => '',
    :profile => 'Ted is a lifelong companion to Mark. He is actively involved in all aspects of Mark\'s life, acting as a constant sounding board and confidant in all aspects of the business.',
    :order_no => '2',
    :published => true
  },
  {
    :name => 'Mairead McGinley',
    :image => '',
    :profile => 'Mairead joins the BlackDog team as Associate Director based out of the VilleFranche office.

Mairead demonstrates attention to detail and meticulous planning capability when locating and negotiating properties for our clients. With a strong background in business, Mairead has perfect judgement in balancing the needs of our clients and those of the property owners - a skill which cannot be underestimated.

Mairead has extensive experience in managing luxury property s within the French Riviera and having graduated with an honours degree in International Business and Languages, she is a valued asset and support to BlackDog.

Mairead has an enthusiasm for skiing and swimming and, due to her interest in French Culture, she is well equipped to advise on exhilarating and educational activities throughout the French Riviera.',
    :order_no => '3',
    :published => true
  }
].each do |c|
  Member.create(c)
end
puts 'All Team Members created'

