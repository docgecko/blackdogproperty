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

puts 'SETTING UP TESTIMONIALS'
[
  {
    :name => 'John B',
    :location => 'Eze, France',
    :details => 'We have just come back from a holiday in one of your BlackDog accredited villas and it was amazing. We have never felt so relaxed and spoiled with every detail taken care of.

We won\'t hesitate in recommending our friends and colleagues to visit your site. Thanks so much',
    :order_no => '1',
    :published => true
  },
  {
    :name => 'Mr Peter W',
    :location => 'Abergavenny',
    :details => 'I consulted in BlackDog regarding the landscape and development of our garden.  I had received a number of ideas and possible solutions from other companies which had left me feeling uncertain.  Within 30 minutes of meeting Mark, his obvious knowledge of the situation had saved me approximately &pound;100k in building costs not to mention the avoided disruption. Very professional, very experienced and a delight to work with.

BlackDog have subsequently undertaken a few projects for me, each one I can truly attest to their success. Just great guys to have around, courteous funny, but above all really made it happen. I would recommend them in an instant.',
    :order_no => '2',
    :published => true
  },
  {
    :name => 'Mr Jet Blackwood',
    :location => 'France',
    :details => 'I contacted BlackDog to build a new pool and to develop a summer house. I cannot speak highly enough about the BlackDog team that did the work, it made a daunting task a really enjoyable experience.

There were some changes that we requested during the build, each time BlackDog explained the options, the costs and relative benefits. This was done in a completely transparent way which allowed us to make the right decisions.

Thanks to Mark and the guys',
    :order_no => '3',
    :published => true
  },
  {
    :name => 'David Bristow',
    :location => 'Hants',
    :details => 'I asked Mark to find me a rental this summer that afforded me both a high standard of living close to great restaurants and the France vibe. What I found upon reaching the villa was that and more. Mark arranged everything for me, from restaurants to a scuba dive. The service and professionalism shown was without equal. I will be back next year. Thanks again.',
    :order_no => '4',
    :published => true
  }
].each do |c|
  Testimonial.create(c)
end
puts 'All Testimonials created'