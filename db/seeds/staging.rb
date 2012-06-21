# encoding: UTF-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


puts 'SETTING UP USER LOGINS'
User.create( 
  :email => 'daren.sdw@gmail.com', 
  :password => 'secret', 
  :password_confirmation => 'secret', 
  :username => 'docgecko', 
  :first_name => 'Daren', 
  :last_name => 'Warburton')
puts 'All users created'


puts 'SETTING UP ADMIN LOGINS'
Admin.create(
  :email => 'daren.sdw@gmail.com', 
  :password => 'Cup4te4s',
  :password_confirmation => 'Cup4te4s')
Admin.create(
  :email => 'admin@blackdogproperty.com', 
  :password => 'Abergavenny46',
  :password_confirmation => 'Abergavenny46')
puts 'All admins created'


puts 'SETTING UP PROPERTIES & PHOTOS'
p = Property.create(
  :title => 'Renovated Modern Villa in a Private Domaine',
  :location => 'Villefranche sur mer',
  :country => 'France',
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
  :purpose_ids => [ 'rental' ],
  :price_sale => '',
  :price_rental => 'Rental prices start from €5000 per week',
  :coordinates => [ 43.707318, 7.314133 ],
  :zoom => 11,
  :position => 1,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_graham/153.jpg')),
  :position => 1,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_graham/DSC_0080.JPG')),
  :position => 2,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_graham/DSC_0087.JPG')),
  :position => 3,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_graham/DSC_0094.JPG')),
  :position => 4,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_graham/079.jpg')),
  :position => 5,
  :featured => true,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_graham/DSC_0116.JPG')),
  :position => 6,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_graham/DSC_0150.JPG')),
  :position => 7,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_graham/DSC_0132.JPG')),
  :position => 8,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_graham/DSC_0170.JPG')),
  :position => 9,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_graham/DSC_0178.JPG')),
  :position => 10,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_graham/DSC_0146.JPG')),
  :position => 11,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_graham/073.jpg')),
  :position => 12,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_graham/172.jpg')),
  :position => 13,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_graham/134.jpg')),
  :position => 14,
  :featured => false,
  :published => true)
  
p = Property.create(
  :title => 'Large Belle Epoque Villa in Beautiful Villefranche',
  :location => 'Villefranche sur mer',
  :country => 'France',
  :reference => 'VSMJSG',
  :bio => 'Imposing five bedroom villa in heart of Villefranche town. This large (3000sq ft/300m2) former royal residence features a garden, large heated swimming pool, roof terrace and wonderful views across the village to the sea. The villa has just been renovated to the very highest standard.',
  :description => 'The 3 bedroom apartment is very large and has is a U shaped layout. Built in 1820 (and traversing Rue Obscure, dating from the 13th century) the entrance has bedroom 1 to the left (2 single beds), then a fully fitted Kitchen with a basement off, housing the air-conditioning, ironing, washer and dryer. Beyond the lower hall is the main room. Bedroom 2 and 3 each have huge sleigh beds with ensuite bathrooms. The main bedroom has 2 windows overlooking the port.

Everything in the apartment is new, with a very high standard of furniture, bedding, curtains, fabrics, flooring etc. The 3 bathrooms are clad in Pink Portugese Marble and the main bathroom has a high back bath at the window overlooking the port! All bathrooms have walk-in showers. Floors are Oak and the furniture is French Provencale style. The kitchen is Cream Provencale with a tiled floor. The total area is c. 2400 sq. feet making this the largest apartment in the Old Town.

The location is unbeatable as it has 5 windows to the front (+ 6 at the back) and there are no stairs to climb. There are 2 balconies to the front. One is fitted with table and chairs. All ceilings are high as it was constructed from 3 old apartments made into one! The basement has a separate entrance for bicycles etc if required. 

Although the apartment is on the second floor from the port side, the entrance is on ground level from Rue du Poiliu, meaning that there are no steps and that this apartment is suitable for the infirm. A car is not necessary in Villefranche and the property is within walking distance to all shops restaurants as well as public transport links.',
  :facilities => '- Air-conditioning
- Central heating
- Safe
- 5 bedrooms – sleeps 10
- 5 bathrooms
- Lounge seating 10 –with fireplace
- Dining seating 10
- Large gated pool	
- Outdoor dining 
- Sun Loungers
- Badminton court 
- BBQ
- Private garage
- Dishwasher * Freezer * Fridge * Grill * Hob * Microwave * Oven * Washing machine * Dryer *Icemaker 
- TV with full satellite
- Wifi
- Large terrace and garden
- Driveway parking and separate garage',
  :purpose_ids => [ 'rental', 'sale' ],
  :price_sale => '€5m',
  :price_rental => 'Rental prices start from  €6600 per week',
  :coordinates => [ 43.702974, 7.307848 ],
  :zoom => 11,
  :position => 2,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_seriamis/Badminton-court-1.jpg')),
  :position => 1,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_seriamis/Bathroom-upstairs.jpg')),
  :position => 2,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_seriamis/Bedroom-4.jpg')),
  :position => 3,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_seriamis/Bedroom-1.jpg')),
  :position => 4,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_seriamis/Bedroom-2.jpg')),
  :position => 5,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_seriamis/Drawing-room.jpg')),
  :position => 6,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_seriamis/Front gate open.jpg')),
  :position => 7,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_seriamis/Front.jpg')),
  :position => 8,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_seriamis/Kitchen-table.jpg')),
  :position => 9,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_seriamis/kitchen.jpg')),
  :position => 10,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_seriamis/Pool.jpg')),
  :position => 11,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_seriamis/Rear-side.jpg')),
  :position => 12,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_seriamis/Stairs.jpg')),
  :position => 13,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_seriamis/Villa-rear.jpg')),
  :position => 14,
  :featured => false,
  :published => true)

p = Property.create(
  :title => 'Spectacular Belle Epoque Villa',
  :location => 'Villefranche sur mer',
  :country => 'France',
  :reference => 'VSMJSo',
  :bio => 'Beautiful old villa in top class condition with a southerly panoramic view over the bay of Villefranche and 1 mile from Cap Ferrat. It has been completely renovated to the absolute highest standard. Built in 1880, it has all the beautiful Belle Epoque features of that period, and is only 100m from the beach. There is a guest quarters at the side and a guardian\'s house at the other side. This villa is perfect for entertaining as it can cater for up to 50 guests. The views over the bay are astonishing and it gets sun all day.',
  :description => 'As soon as you see this astounding villa you appreciate how beautiful it really is. Set over 3 floors as well as having a roof top terrace this property has been renovated with excellence and luxury in mind. 

The ground floor of the villa offers the open plan lounge as well as the beautifully designed Clive Christian kitchen, which has all mod cons. As you venture upstairs in this beautiful property you are greeted by 6 perfectly decorated bedrooms with balconies off some of the bedrooms The villa is light and airy throughout. On the top floor a door leads you outside to the rooftop terrace with unbelievable views out over Villefranche and Cap Ferrat.  Each bedroom in the main house is equal with the same views and has a walk in dressing area with en-suite bathroom. One of the bedrooms also has an office area.

Outside there is a garden as well as pool area with sun loungers and beautiful views out over the port of Villefranche. The garden has been used in the past to host wedding breakfasts as well as catered evening soirées. 

Around the back of the property there are two separate buildings, one a 1 bedroom apartment with kitchenette and the 2nd a mezzanine studio flat, perfect for staff. 

The villa is located just a 2 minute walk to the beach as well as straight down into the old town of Villefranche with all its beautiful restaurants, shops as well as the famous Citadelle.',
  :facilities => '- 6 bedrooms – sleeps 12
- 6 bathrooms
- Separate 1 bed apmt
- Separate studio/ nanny flat
- Modern renovated kitchen * Dishwasher * Freezer * Fridge * Grill * Hob * Microwave * Oven
- Sun loungers
- Dining area for 10
- Living area for 10
- Roof terrace 
- Garden
- Pool (heated if required)
- Satellite TV
- Air-conditioning
- Central heating
- Safe
- Private garage',
  :purpose_ids => [ 'rental' ],
  :price_sale => '',
  :price_rental => '',
  :coordinates => [ 43.707332, 7.314218 ],
  :zoom => 11,
  :position => 3,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_soleia/Aerial-view.jpg')),
  :position => 1,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_soleia/Bed-1.jpg')),
  :position => 2,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_soleia/Bed-3.jpg')),
  :position => 3,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_soleia/Bed-4.jpg')),
  :position => 4,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_soleia/Dining.jpg')),
  :position => 5,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_soleia/Front.jpg')),
  :position => 6,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_soleia/Kitchen.jpg')),
  :position => 7,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_soleia/Lounge.JPG')),
  :position => 8,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_soleia/Pool-1.jpg')),
  :position => 9,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_soleia/Pool-2.jpg')),
  :position => 10,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_soleia/Veranda off lounge.JPG')),
  :position => 11,
  :featured => false,
  :published => true)
    
p = Property.create(
  :title => 'Luxury 3 Bed Villa with Private Pool',
  :location => 'Villefranche sur mer',
  :country => 'France',
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
  :purpose_ids => [ 'rental' ],
  :price_sale => '',
  :price_rental => 'Rental prices start from €5000 per week',
  :coordinates => [ 43.708458, 7.303069 ],
  :zoom => 11,
  :position => 4,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_stuart/DSC_0228.JPG')),
  :position => 1,
  :featured => true,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_stuart/DSC_0229.JPG')),
  :position => 2,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_stuart/DSC_0230.JPG')),
  :position => 3,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_stuart/DSC_0231.JPG')),
  :position => 4,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_stuart/DSC_0233.JPG')),
  :position => 5,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_stuart/DSC_0234.JPG')),
  :position => 6,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_stuart/DSC_0235.JPG')),
  :position => 7,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_stuart/DSC_0236.JPG')),
  :position => 8,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_stuart/DSC_0237.JPG')),
  :position => 9,
  :featured => false,
  :published => true)
      
p = Property.create(
  :title => 'Recently Renovated Sea View Villa',
  :location => 'Beaulieu sur mer',
  :country => 'France',
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
  :purpose_ids => [ 'rental' ],
  :price_sale => '',
  :price_rental => 'Rental prices start from €18000 per week',
  :coordinates => [ 43.706907, 7.323557 ],
  :zoom => 11,
  :position => 5,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_savina/DSCF3849.JPG')),
  :position => 1,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_savina/DSCF5997.JPG')),
  :position => 2,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_savina/DSCF6004.JPG')),
  :position => 3,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_savina/DSCF6021.JPG')),
  :position => 4,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_savina/hpim0001.jpg')),
  :position => 5,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_savina/s5000624.jpg')),
  :position => 6,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_savina/SANY0005.JPG')),
  :position => 7,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_savina/SANY0180.JPG')),
  :position => 8,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_savina/SANY0225.JPG')),
  :position => 9,
  :featured => false,
  :published => true)

p = Property.create(
  :title => 'Luxury Villa with Exceptional Sea Views and Private Access to the Sea',
  :location => 'St Jean Cap Ferrat',
  :country => 'France',
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
  :purpose_ids => [ 'rental', 'sale' ],
  :price_sale => '€50m',
  :price_rental => 'June €85 000 p/mth
July €108 000 p/mth
August – offer dependant',
  :coordinates => [ 43.69087, 7.32316 ],
  :zoom => 11,
  :position => 6,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_ferrat/photo.JPG')),
  :position => 1,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_ferrat/photo_02.JPG')),
  :position => 2,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_ferrat/photo_03.JPG')),
  :position => 3,
  :featured => false,
  :published => true)

p = Property.create(
  :title => '3 Bed Villa in a Private Residence',
  :location => 'Villefranche sur mer',
  :country => 'France',
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
  :purpose_ids => [ 'rental' ],
  :price_sale => '',
  :price_rental => 'Rental prices start from €3500 per week',
  :coordinates => [ 43.702974, 7.307848 ],
  :zoom => 11,
  :position => 7,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0199.JPG')),
  :position => 1,
  :featured => true,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0198.JPG')),
  :position => 2,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0197.JPG')),
  :position => 3,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0200.JPG')),
  :position => 4,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0201.JPG')),
  :position => 5,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0202.JPG')),
  :position => 6,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0203.JPG')),
  :position => 7,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0204.JPG')),
  :position => 8,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0205.JPG')),
  :position => 9,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0206.JPG')),
  :position => 10,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0207.JPG')),
  :position => 11,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0208.JPG')),
  :position => 12,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0209.JPG')),
  :position => 13,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0210.JPG')),
  :position => 14,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0211.JPG')),
  :position => 15,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0212.JPG')),
  :position => 16,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0213.JPG')),
  :position => 17,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0214.JPG')),
  :position => 18,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0215.JPG')),
  :position => 19,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0216.JPG')),
  :position => 20,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0217.JPG')),
  :position => 21,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0219.JPG')),
  :position => 22,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0220.JPG')),
  :position => 23,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0221.JPG')),
  :position => 24,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_tony/DSC_0222.JPG')),
  :position => 25,
  :featured => false,
  :published => true)
          
p = Property.create(
  :title => 'Luxury 5 Bedroom Villa overlooking the Bay of Villefranche',
  :location => 'Villefranche sur mer',
  :country => 'France',
  :reference => 'VSMJO',
  :bio => 'This villa overlooks the bay of Villefranche to Cap Ferrat and has been modernised to the highest standard. Its South facing direction ensures it gets the sun all day, and the location is perfect - only a 4 minute walk to the port of Villefranche 130 metres from the beach and the train is nearby which is 2 stops from Nice and 4 stops to Monte Carlo.',
  :description => 'This villa has just been restored to its former glory, having been divided into three apartments for many years. It has marble flooring throughout and is fitted out with top of the range furniture. This is one of the most outstanding villas in a quiet area and is about 2500sq feet with 3 large balconies. The views from this part of Villefranche are regarded as unrivalled anywhere in the world! 

There is ample space, with three walk-out balconies. The property is over three levels with all the double bedrooms on the upper two floors. There is a single room off the lounge. The kitchen is light and beautifully renovated with all modcons and has a dining area. The lounge is open plan with lounge seating with Tv Dvd etc.  There is a garage with room for one car, and there is ample free parking outside the villa. This property is located just beside another one of our properties Soleia so if you would be looking for corporate or large bookings these two properties are perfect.',
  :facilities => '- Air-conditioning
- Central heating
- Safe
- 5 bedrooms – sleeps 9
- 4 bathrooms
- Private garage
- Dishwasher * Freezer * Fridge * Grill * Hob * Microwave * Oven * Washing machine
- Living room living area seating for 10
- Fireplace 
- TV with full satellite
- Wifi
- Sun loungers
- Outdoor dining area  
- BBQ
- Plunge pool (heated if required)
- 3 Terraces',
  :purpose_ids => [ 'rental', 'sale' ],
  :price_sale => '€5m',
  :price_rental => 'Rental prices start from  €5500 per week',
  :coordinates => [ 43.707332, 7.314218 ],
  :zoom => 11,
  :position => 8,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_oursinade/Front-4.jpg')),
  :position => 1,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_oursinade/Kitchen-2.JPG')),
  :position => 2,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_oursinade/Ours-bath-1.jpg')),
  :position => 3,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_oursinade/Ours-bed-1.jpg')),
  :position => 4,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_oursinade/Ours-bed-2.jpg')),
  :position => 5,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_oursinade/Oursinade-lounge-1.jpg')),
  :position => 6,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_oursinade/patio.jpg')),
  :position => 7,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_oursinade/Pool-2.JPG')),
  :position => 8,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_oursinade/Terrace-1.jpg')),
  :position => 9,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_oursinade/Terrace-5.jpg')),
  :position => 10,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_oursinade/Villa.jpg')),
  :position => 11,
  :featured => false,
  :published => true)

p = Property.create(
  :title => 'Large Deluxe 3 Bedroom Apartment overlooking the port of Villefranche',
  :location => 'Villefranche sur mer',
  :country => 'France',
  :reference => '',
  :bio => 'Very large (2400sq ft/230m2) three bedroomed apartment overlooking Villefranche port. This apartment has been renovated with no expense spared, and is possibly the finest apartment available to rent in Villefranche. The location is unbeatable, with two balconies overlooking the port and onto Cap Ferrat.',
  :description => 'The 3 bedroom apartment is very large and has is a U shaped layout. Built in 1820 (and traversing Rue Obscure, dating from the 13th century) the entrance has bedroom 1 to the left (2 single beds), then a fully fitted Kitchen with a basement off, housing the air-conditioning, ironing, washer and dryer. Beyond the lower hall is the main room. Bedroom 2 and 3 each have huge sleigh beds with ensuite bathrooms. The main bedroom has 2 windows overlooking the port.

Everything in the apartment is new, with a very high standard of furniture, bedding, curtains, fabrics, flooring etc. The 3 bathrooms are clad in Pink Portugese Marble and the main bathroom has a high back bath at the window overlooking the port! All bathrooms have walk-in showers. Floors are Oak and the furniture is French Provencale style. The kitchen is Cream Provencale with a tiled floor. The total area is c. 2400 sq. feet making this the largest apartment in the Old Town.

The location is unbeatable as it has 5 windows to the front (+ 6 at the back) and there are no stairs to climb. There are 2 balconies to the front. One is fitted with table and chairs. All ceilings are high as it was constructed from 3 old apartments made into one! The basement has a separate entrance for bicycles etc if required. 

Although the apartment is on the second floor from the port side, the entrance is on ground level from Rue du Poiliu, meaning that there are no steps and that this apartment is suitable for the infirm. A car is not necessary in Villefranche and the property is within walking distance to all shops restaurants as well as public transport links.',
  :facilities => '- Air-conditioning
- Central heating
- Safe
- 3 bedrooms – sleeps 8
- 4 bathrooms
- Lounge seating 8
- Dining seating 6 
- Private garage
- Dishwasher * Freezer * Fridge * Grill * Hob * Microwave * Oven * Washing machine * Dryer
- Living room living area seating for 10
- Fireplace 
- TV with full satellite
- Wifi
- 2 balconies',
  :purpose_ids => [ 'rental', 'sale' ],
  :price_sale => '€3m',
  :price_rental => 'Rental prices start from  €3200 per week',
  :coordinates => [ 43.704144, 7.312571 ],
  :zoom => 11,
  :position => 9,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/apartment_seagulls/Balconies.jpg')),
  :position => 1,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/apartment_seagulls/Bed-3.jpg')),
  :position => 2,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/apartment_seagulls/Kitchen-1.JPG')),
  :position => 3,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/apartment_seagulls/Lounge.JPG')),
  :position => 4,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/apartment_seagulls/Main bath-shower.jpg')),
  :position => 5,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/apartment_seagulls/Main bath.jpg')),
  :position => 6,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/apartment_seagulls/Quayside windows.jpg')),
  :position => 7,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/apartment_seagulls/Restaurants.jpg')),
  :position => 8,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/apartment_seagulls/Seagulls balcony.jpg')),
  :position => 9,
  :featured => false,
  :published => true)

p = Property.create(
  :title => 'Renovated Art Deco Villa',
  :location => 'Cap d’Antibes',
  :country => 'France',
  :reference => 'CAC',
  :bio => 'Originally a 1960’s build, this beautiful Art Deco property has just been renovated to the highest standard with beautiful Italian kitchen and marble floors throughout. Surrounded by beautiful gardens and terraces with gorgeous sea views this is a spectacular property in a prime location on the Cap d’Antibes one of the most prestigious places on the Riviera.',
  :description => 'This 4 bedroom villa has been renovated to the highest standard with the most quality finishes throughout.  It has a large entrance hall followed by an open plan lounge and dining area of approx. 60m2. This leads into the beautiful Italian kitchen which has its own separate entrance to the garden. 

The bedroom/ office on the ground floor has an access out to a terrace over-looking the pool. Two further bedrooms open out onto the 1st floor terrace with a family bathroom and separate toilet. The master bedroom is 40m2 with an ensuite of 20m2 and it has a large terrace which looks out over the sea. 	 

The exterior or the property has a rooftop terrace, as well as lower balconies and a large manicured garden. The pool can be heated and is surrounded by patio areas with a pool heater for any cool evenings. There is also a Summer kitchen and BBQ for dining al fresco. 

The property has 2 separate buildings both with their own access. One is a studio apartment and the 2nd a 2 bedroom apartment with kitchenette and shower. Both have been fitted with reversible AC.',
  :facilities => '- 4 bedrooms – sleeps 8
  - 4 bathrooms
  - Separate 2 bed apartment
  - Separate studio 
  - Modern renovated -kitchen -Dishwasher * Freezer * Fridge * Grill * Hob * Microwave * Oven
  - Sun loungers
  - Roof terrace of 120m2 
  - Garden of 900m2 
  - Summer kitchen 
  - 14 * 6m pool (heated if required)
  - SatelliteTV
  - Air-conditioning
  - Electric shutters
  - Central heating
  - Safe
  - Internal phone system
  - New alarm system 
  - Private garage as well as parking on driveway',
  :purpose_ids => [ 'rental' ],
  :price_sale => '',
  :price_rental => 'Rental prices start from €18000 per week',
  :coordinates => [ 43.706907, 7.323557 ],
  :zoom => 11,
  :position => 10,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_d_antibes/A typical summer view.JPG')),
  :position => 1,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_d_antibes/Bedroom 3 v.JPG')),
  :position => 2,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_d_antibes/Bedroom 3.JPG')),
  :position => 3,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_d_antibes/chambre de maitre 1.JPG')),
  :position => 4,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_d_antibes/chambre de maitre 2.JPG')),
  :position => 5,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_d_antibes/Chambre de maitre terrasse.JPG')),
  :position => 6,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_d_antibes/Dining 1.JPG')),
  :position => 7,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_d_antibes/Ensuite 1.JPG')),
  :position => 8,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_d_antibes/Ensuite 2.JPG')),
  :position => 9,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_d_antibes/garden 2.JPG')),
  :position => 10,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_d_antibes/Garden to right.JPG')),
  :position => 11,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_d_antibes/Lounge 1.JPG')),
  :position => 12,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_d_antibes/Lounge 3.JPG')),
  :position => 13,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_d_antibes/Lounge 4.JPG')),
  :position => 14,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_d_antibes/Lounge 5.JPG')),
  :position => 15,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_d_antibes/Lounge 6.JPG')),
  :position => 16,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_d_antibes/Pool from summer kitchen.JPG')),
  :position => 17,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_d_antibes/Roof garden 1.JPG')),
  :position => 18,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_d_antibes/Sejour dining.jpg')),
  :position => 19,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_d_antibes/Summer kitchen.JPG')),
  :position => 20,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => open(File.join('http://s3-eu-west-1.amazonaws.com/', 'bdp-assets-staging/properties/villa_cap_d_antibes/View to East.jpg')),
  :position => 21,
  :featured => false,
  :published => true)
puts 'All Properties & Photos created'