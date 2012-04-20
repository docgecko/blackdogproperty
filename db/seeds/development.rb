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
    :password => 'secret',
    :password_confirmation => 'secret',
    :admin => true
  }
].each do |u|
  User.create(u)
end
puts 'All users created'

puts 'SETTING UP PROPERTY TYPES'
[
  {
    :name => 'rental',
    :description => 'For rental'
  },
  {
    :name => 'sale',
    :description => 'For sale'
  },
  {
    :name => 'renovation',
    :description => 'Renovation project'
  }
].each do |u|
  Type.create(u)
end
puts 'All property types created'

puts 'SETTING UP COUNTRIES'
[
  {
    :name => 'France', 
    :description => 'France is one of the prominent countries of the European Union and still attracts so much interest from foreign residents looking to relocate overseas. The country is truly unique this has an amazing variety of climates, sun, sea and snow. It is steeped in history and its architecture is both classical and chic.

France is one of the true metropolitan countries of the world, as it integrates into its own a variety of different cultures over the centuries, which has in the past resulted in a number of internal disputes. The country is heavily infused with certain elements of religion and culture prevalent in different areas.

The country is well known for its love of the arts and architecture and has a long and great history, taking in revolutions, wars and major changes in the way that the country is run, full, vibrant and headstrong. Its freedom of speech has attracted a number of outspoken and controversial figures to lead its political governance and has placed all areas of society under discussion.

The housing market in France has historically been a lot steadier than for example the UK market (and many other European partners). A large number of European residents relocating to France where property prices are on average substantially lower.

However, there is a large difference in pricing, depending on location, with older housing less expensive than new builds (this is a market which has attracted UK buyers, who tend to look for history and character for their properties).'
  },
  {
    :name => 'Portugal', 
    :description => 'Looking for romance, discovering culture, living adventure, relaxing? Indulge yourself in Portugal.

Portugal has something for everyone. It is a country renowned for its famous golf courses and a haven for the sports minded holiday maker.

Portugal has plenty of museums, stunning architecture and acres of stunning countryside, as well as the magical town of Sintra with its hilltop fairy tale palace and ancient castle. It is easy to overlook the beautiful historic cities and rich cultural centre of Lisbon.

Portugal is host to long open shores and beaches reaching out to crystal deep blue waters and offset by dramatic cliff-top backdrops and landscapes where you can explore and soak up the sun.'
  },
  {
    :name => 'Spain', 
    :description => 'Spain offers a captivating landscape, sun-drenched and untamed to the south of the wild and majestic Pyrenees where this passionate nation works a mysterious magic.

Diversity is on offer within the vast stretches of coastline, emerald green mountains and acres of abundant olive groves. Spain is dappled with culture. The rich passion of Flamenco, the Toreros (bull fights) and a spectacular selection of culinary mouth-watering flavours bring colour and vibrancy to this eclectic country.

Bordered the West by the Atlantic and the East by the Mediterranean, Spain\'s glittering beaches attract holiday makers who seek the sun, surfing and golf. A zest for life creates an intense hedonistic vibe in the effervescent cities and if there is one thing which Spanish love it is to eat, drink and party!'
  },
  {
    :name => 'Italy', 
    :description => 'Italy is located in Southern Europe on the Italian Peninsula and it\'s bordered by the Mediterranean Sea, which hosts two Italian Islands: Sardinia and Sicily, each corner of this beautiful country will take you back to ancient times to Romeo and Juliet the Roman empire, amphitheatres, the leaning tower of Pisa and more.

Florence and its artistic productions and fashion, Rome, the capital city known as the eternal city, Venice, the romantic city built under water, Verona, an imposing city setting of the drama "Romeo and Juliet" and Milan, the most fashionable city in Italy.

Nature has a special place in every trip to Italy; the amazing panoramic natural resources and landscapes such as: The Alps in the North, The Bay of Naples and Mt. Vesuvius are some of the most famous views.

A trip to Italy is not only about culture, art, history, paintings and museums but about the exclusive restaurants, pizzerias, cafes and a vibrant and passionate nightlife - whatever your age.'
  }
].each do |u|
  Country.create(u)
end
puts 'All countries created'

puts 'SETTING UP TEAM MEMBERS'
[
  {
    :name => 'Mark Tovey 07540 706994',
    :avatar => "profile_mark.jpg",
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
    :avatar => "profile_ted.jpg",
    :profile => 'Ted is a lifelong companion to Mark. He is actively involved in all aspects of Mark\'s life, acting as a constant sounding board and confidant in all aspects of the business.',
    :order_no => '2',
    :published => true
  },
  {
    :name => 'Mairead McGinley',
    :avatar => "profile_mairead.jpg",
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