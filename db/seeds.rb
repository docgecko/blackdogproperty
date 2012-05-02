# encoding: UTF-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)

puts 'SETTING UP SOURCE'
[
  {
    :name => 'Search engine',
  },
  {
    :name => 'Word of mouth'
  },
  {
    :name => 'Advertising'
  },
  {
    :name => 'Press'
  },
  {
    :name => 'Link from another site'
  },
  {
    :name => 'Existing client'
  },
  {
    :name => 'Referred by existing client'
  }
].each do |u|
  Source.create(u)
end
puts 'All sources created'

puts 'SETTING UP INTERESTS'
[
  {
    :name => 'Finding'
  },
  {
    :name => 'Renting'
  },
  {
    :name => 'Renovation'
  },
  {
    :name => 'Services'
  },
  {
    :name => 'Sales'
  }
].each do |u|
  Interest.create(u)
end
puts 'All interests created'


puts 'SETTING UP TYPES'
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

puts 'SETTING UP PROPERTIES'
[
  {
    :title => 'Villa Peter',
    :location => 'Villefrance sur mer',
    :country_id => 'france',
    :reference => '',
    :bio => '',
    :description => '',
    :facilities => '',
    :type_ids => [ ],
    :price_sale => '',
    :price_rental => '',
    :coordinates => [ 0,0 ],
    :zoom => 11,
    :order_no => 0,
    :featured => true,
    :published => true
  },
  {
    :title => 'Renovated Modern Villa in a Private Domaine',
    :location => 'Villefranche sur mer',
    :country_id => 'france',
    :reference => 'VSMG',
    :bio => '4 bedroom luxury villa situated in the hills of Villefranche sur Mer. This villa has been fully renovated to the highest standard and it\'s location is second to none.  With outstanding views of Villefranche and Cap Ferrat this property is the perfect place to relax and enjoy the beauty of the French Riviera. 

Villa Azur is situated in a private secure domain has recently been transformed into a fantastic contemporary home with 4 bedrooms and luxury bathrooms, large heated pool and beautiful dining terrace to spend the evenings.',
    :description => 'This property is located just off the Moyenne Corniche in the private gated domain "Le Castellet". It has stunning sea views from Cap Ferrat through Villefranche. The property is located less than 5 mins from the Col de Villefranche which is a small town with shops and a few restuarants. From here there is public transport into Nice or down to the old town port of Villefranche sur Mer where there is a wide selection of restaurants as well as local markets as well as the beautiful beach. 

Public transport links in the area are very good but it is also good to have a car in this area as there is so much to do and explore, from the art, culture and museums in Nice to the historic old town of Eze Village or just the outstanding views all around the Cote d\'Azur. 

The property itself is a stunning 4 bedroom modern villa surrounded by well-maintained terraces as well as a pool and tiled area outside. When you first enter the villa you truly feel how light and airy it is and its modern open plan living area opening out to the pool and the views from the property makes you catch your breath. The kitchen has everything you could ever require to chef up a perfect meal although a private chef can be arranged at your convenience. 

As you go downstairs there is another open plan room with gym equipment as well as games and a large space, perfect also for children. There is one bedroom located down here as well as a separate utility room. 

The beautiful curved staircase with port window leads you up to the top floor. There are 3 bedrooms here two large doubles and either a double or a twin. All rooms are ensuite with wardrobe space but the master has a large built in wardrobe. Terrace doors open out to give you a view over the pool and down onto Cap Ferrat. The other double bedroom had a small balcony, the perfect place to enjoy your coffee in the morning. 

Villa Azur is in a prime location and has everything you could want for the perfect holiday in the French Riviera, location, views and every comfort you could require.',
    :facilities => '- Air-conditioning
- Central heating
- Safe
- 4 bedrooms - sleeps 8
- 4 bathrooms
- Private covered driveway.
- Dishwasher * Freezer * Fridge * Grill * Hob * Microwave * Oven * Integrated wine fridge
- Living room living area seating for 8.
- Dining room seating for 10
- Full Bose entertainment system 
- Plasma TV
- 6 sun loungers
- Outdoor dining area for 8  
- BBQ
- Large pool (heated if required)
- Gym and games room',
    :type_ids => [ 'rental' ],
    :price_sale => '',
    :price_rental => 'Rental prices start from €5000 per week',
    :coordinates => [ 43.707318, 7.314133 ],
    :zoom => 11,
    :order_no => 1,
    :featured => false,
    :published => true
  },
  {
    :title => 'Luxury 3 Bed Villa with Private Pool',
    :location => 'Villefranche sur mer',
    :country_id => 'france',
    :reference => 'VSMS',
    :bio => 'Luxurious 3 Bedroom Modern Villa With Private Pool And 180 degree Panoramic Sea Views Located On A Quiet, Private Road In The Hills Above The Village of Villefranche-Sur-Mer. This property is located within walking distance of the town but keeps itself private and peacefully out of reach. The renovation on this property has been completed to the highest standard and everything about the property says high end.',
    :description => 'This 3 bedroom villa is situated just up off the Baisse Corniche of Villefranche sur Mer. This property and its surrounds have been renovated to the highest standard and have all mod cons. The outstanding views look over Mont Boron and on a sunny day you can see far past Nice and even the airport. The modern décor, top quality finish and amenities will provide you with a luxuriously comfortable place to call home.

The property is located just a short drive from the local shops and restaurants, either in the Old Town of Villefranche sur Mer or in the Col de Villefranche. Local taxis can be arranged through the concierge service for evenings in local restaurants

Public transport links in the area are very good but it is also good to have a car in this area as there is so much to do and explore, from the art, culture and museums in Nice to the historic old town of Eze Village or just the outstanding views all around the Cote d\'Azur. 

The property consists of 2 double bedrooms  as well as a twin, all en suite, a large private study with wifi etc, a large open plan living space and dining area, a private wc and of course the Siemens kitchen which has every spec of technology you could require. The twin and master bedrooms are located downstairs and terrace doors open out to the pool and garden. 

The terraces that wrap all around the property offer stunning views. From outside the main living area you have a dining space for 4 that offers 180 degree views. The terrace outside the kitchen has a dining area for 8 with BBQ etc. as well as sun loungers and access to the garden. The pool is 7x4m and is fitted with an electronic hard cover as well as an alarm. There is also a table tennis table, trampoline and swing set for children.',
    :facilities => '- Air-conditioning
- Central heating, 
- 3 bedrooms - sleeps 6
- 3.5 bathrooms
- Private garage
- Secure gated driveway
- Dishwasher * Freezer * Fridge * Grill * Hob * Microwave * Oven * Nespresso
- Living room living area seating for 8
- Dining room seating for 10
- Full Bose entertainment system 
- Plasma TV with UK Sky package
- 4 sun loungers
- Outdoor dining area for 8  
- BBQ
- Large pool (heated if required)
- Study with wifi',
    :type_ids => [ 'rental' ],
    :price_sale => '',
    :price_rental => 'Rental prices start from €5000 per week',
    :coordinates => [ 43.708458, 7.303069 ],
    :zoom => 11,
    :order_no => 2,
    :featured => false,
    :published => true    
  },
  {
    :title => 'Luxury Villa with Exceptional Sea Views and Private Access to the Sea',
    :location => 'St Jean Cap Ferrat',
    :country_id => 'france',
    :reference => 'CFV',
    :bio => 'This large rustic French property is located in the highly sought after area of Cap Ferrat. With its stunning views all around the Bay of Cap Ferrat and Villefranche this property is a piece of heaven. It has a lovely homely feel while still taking your breath away. 

The gardens and terraces around it keep you feeling completely private and the direct walkway down to the sea feels like a secret garden. Once you reach the bottom, the famous Plage Passable is just a 2 minute walk away.',
    :description => 'This property is a 3 bedroom property with a separate apartment on the lower floor. There is also a studio connected to the main house which is perfect for staff. The lounge dining area is a large open plan room with fireplace, comfortable seating and a large dining table. It opens out to a terrace with dining area and unbelievable views out over the bay of Villefranche and Cap Ferrat. The property has direct sunshine from morning until late evening perfect for dining al fresco. 

There are 3 bedrooms on the main floor, as well as bathrooms. They are very provencal and each has patio doors which open out to the terrace and its amazing views. The doors from the master bedroom and bathroom open out to the pool area also. The kitchen has just been renovated and has all mod cons but keeps in with the homely feel of the property. 

The apartment is located just down the stairs and it is made up of a smaller kitchen, salon as well as bedroom with access to the lower terrace. The studio is also located off the lower terrace and is equipped perfectly for staff or guests. 

The pool area has a large pool, outdoor shower, sun loungers, bar as well as a sauna. Just off the pool is the walkway through the gardens down directly to the passage along the sea which leads to the famous Plage Passable. 

The views alone on this property make it one of the most astonishing on the Cap.',
    :facilities => '- Air-conditioning
- Central heating
- 3 bedrooms (sleeps 10)
- 1 independent apartment within the villa 90m2
- 1 separate studio 18m2
- Beautiful gardens
- Pathway with direct access to sea
- Wifi
- Private garage as well as driveway
- Gated Pool
- Sauna
- Outdoor BBQ and bar
- Outdoor terrace
- South facing',
    :type_ids => [ 'rental', 'sale' ],
    :price_sale => '€50m',
    :price_rental => 'June €85 000 p/mth
July €108 000 p/mth
August – offer dependant',
    :coordinates => [ 43.69087, 7.32316 ],
    :zoom => 11,
    :order_no => 3,
    :featured => false,
    :published => true    
  },
  {
    :title => 'Recently Renovated Sea View Villa',
    :location => 'Beaulieu sur mer',
    :country_id => 'france',
    :reference => 'BSMR',
    :bio => '8 bedroom villa recently renovated in the hills of Beaulieu sur Mer with private pool, gardens and outstanding views. Located just above the town of Beaulieu this large property offers everything you require for a luxury stay in the beautiful South of France.',
    :description => 'Beaulieu sur Mer is a beautiful coastal town situated between Nice and Monaco and this property is less than 5 minutes outside the town. Having just been recently renovated while keeping in with the feel of the house, this is a much sought after villa in Beaulieu. 

The villa consists of a beautiful number of rooms over 3 floors and it is surrounded by gardens. As you pull up the drive you are greeted with a beautiful view of the house as well as the lawns with a small pond. The main entrance greets you and leads you into the huge living space with dining area, small office space and comfy lounge space. The kitchen which has been renovated also and is fit for use by a top chef is just off the lounge. There is access to the pool and gardens from both of these rooms and the kitchen also has a seating area. 

Downstairs there are 3 double bedrooms, one en suite and a separate bathroom. They all have terrace doors which open out to the front gardens. On the top floor of the property there are 4 double bedrooms and one twin. There are 3 bathrooms upstairs, en suite in the master and two other shared bathrooms. Terraces off the master as well as two other double rooms offer both sea and pool and garden views over the property. There is also gym equipment on the master terrace. 

The back garden of the property has a large covered teak terrace with seating for dining al fresco as well as sun loungers, large fenced off pool with alarm, BBQ, bar area as well as childrens toys. 

This property is ideal for large groups with families, corporate groups or even just large group of friends.',
    :facilities => '- 8 bedrooms - sleeps 16
- Air-conditioning
- Central heating
- Safe
- 6 bathrooms
- Private gated driveway
- Private garage
- Modern renovated kitchen * Dishwasher * Freezer * Fridge * Grill * Hob * Microwave * Nespresso * Oven
- Living room living area seating for 16.
- Dining room seating for 10 
- Plasma TV with full Sky Package
- Wifi
- Sun loungers
- Outdoor dining area for 16 with extra seating  
- BBQ, outdoor fridge, bar
- Large pool (heated if required)',
    :type_ids => [ 'rental' ],
    :price_sale => '',
    :price_rental => 'Rental prices start from €18000 per week',
    :coordinates => [ 43.706907, 7.323557 ],
    :zoom => 11,
    :order_no => 4,
    :featured => false,
    :published => true    
  },
  {
    :title => '3 Bed Villa in a Private Residence',
    :location => 'Villefranche sur mer',
    :country_id => 'france',
    :reference => 'VSMT',
    :bio => 'This 3 bedroom property is located in a prime location overlooking the beach of Villefranche sur Mer on the Baisse Corniche. It is in a private residence with shared pool and a large terrace overlooking the sea and coastline just a 2 minute walk to the beach.',
    :description => 'This 3 bedroom property is in one of the prime private residences in Villefranche. With 2 secure entrances, private parking, shared pool and astounding views it is in high demand. Access to the beach as well as the bars and restaurants of the old town of Villefranche is by a set of steps direct from the road to the beach. 

There are shared gardens as well as a pool with the property but it is not a large residence so it is rarely too busy. The entrance to the villa itself is very pretty and as you walk into the property it is all open plan and you can see straight out the terrace window. 

The kitchen is very modern with all mod cons, followed by an open plan living space with dining table, large sofa, tv, sound system, wifi etc. The terrace doors open out to a hug terrace with beautiful views down over the beach and coast of Villefranche and Cap Ferrat. 

The 3 ensuite bedrooms are located up stairs. The two front rooms have access to another terrace with a smaller balcony in the 3rd bedroom. The large master has also got a walk in wardrobe. 

The town of Villefranche is only a few minutes’ walk and public transport links are right outside the property. This property is in a prime location for discovering the French Riviera.',
    :facilities => '- Air-conditioning
- Central heating
- 3 bedrooms - sleeps 6
- 4 bathrooms - 3 ensuite
- Secure gated parking
- Dishwasher * Freezer * Fridge * Grill * Hob * Microwave * Oven 
- Living room living area seating for 8.
- Dining room seating for 8
- Full entertainment system 
- Plasma TV
- Outdoor dining area for 8
- Large shared pool',
    :type_ids => [ 'rental' ],
    :price_sale => '',
    :price_rental => 'Rental prices start from €3500 per week',
    :coordinates => [ 43.702974, 7.307848 ],
    :zoom => 11,
    :order_no => 4,
    :featured => false,
    :published => true    
  }  
].each do |c|
  Property.create(c)
end
puts 'All Properties created'
