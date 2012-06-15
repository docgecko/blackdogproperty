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
  :password => 'secret',
  :password_confirmation => 'secret')
puts 'All admins created'


puts 'SETTING UP TEAM MEMBERS'
Member.create(
  :name => 'Mark Tovey 07540 706994',
  :avatar => File.open(File.join(Rails.root, 'app/assets/images/company/profile_mark.jpg')),
  :profile => 'With property being a stable investment in times of uncertainty, Mark\'s ability to find the right property at the right price, whilst always being mindful of a return on your investment is unrivalled.

Mark is the founder of BlackDog Property and has realised a personal dream of finding and renovating outstanding properties in the most beautiful and prestigious area\'s of Europe.

Mark is driven for success, entrepreneurial and an accomplished businessman with a strong commercial acumen. Mark demonstrates impeccable style which is apparent throughout the projects he influences.

BlackDog Property enables others to follow their dreams in confidence, drawing on the expertise of our professional team to achieve results.

Mark is a keen golfer, skier devoted dad to Hannah, Callum and of course Ted.',
  :order_no => '1',
  :published => true)
Member.create(
  :name => 'Ted "Tiberius" Tovey',
  :avatar => File.open(File.join(Rails.root, 'app/assets/images/company/profile_ted.jpg')),
  :profile => 'Ted is a lifelong companion to Mark. He is actively involved in all aspects of Mark\'s life, acting as a constant sounding board and confidant in all aspects of the business.',
  :order_no => '2',
  :published => true)
Member.create(
  :name => 'Mairead McGinley',
  :avatar => File.open(File.join(Rails.root, 'app/assets/images/company/profile_mairead.jpg')),
  :profile => 'Mairead joins the BlackDog team as Associate Director based out of the VilleFranche office.

Mairead demonstrates attention to detail and meticulous planning capability when locating and negotiating properties for our clients. With a strong background in business, Mairead has perfect judgement in balancing the needs of our clients and those of the property owners - a skill which cannot be underestimated.

Mairead has extensive experience in managing luxury property s within the French Riviera and having graduated with an honours degree in International Business and Languages, she is a valued asset and support to BlackDog.

Mairead has an enthusiasm for skiing and swimming and, due to her interest in French Culture, she is well equipped to advise on exhilarating and educational activities throughout the French Riviera.',
  :order_no => '3',
  :published => true)
puts 'All Team Members created'


puts 'SETTING UP PROPERTIES & PHOTOS'
p = Property.create(
  :title => 'Villa Peter',
  :location => 'Villefrance sur mer',
  :country => 'France',
  :reference => '',
  :bio => '',
  :description => '',
  :facilities => '',
  :purpose_ids => [ ],
  :price_sale => '',
  :price_rental => '',
  :coordinates => [ 0,0 ],
  :zoom => 11,
  :order_no => 0,
  :featured => true,
  :published => true)
p.photos.create(
  :title => 'The Summer House',
  :description => 'The Summer House was one of our first project renovations. Nestled in the hills just outside VilleFranche this 3 acre property was in a sad condition. Over some months we restored the property, sympathetically maintaining original features and the rustic charm which makes it such an outstanding holiday location.',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_peter/IMG_4598.JPG')),
  :position => 1,
  :featured => false,
  :published => true)
p.photos.create(
  :title => 'The Summer House',
  :description => 'We created an impressive entrance to the Summer house, using local stone and fragrant plants to line the pathways.',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_peter/IMG_4494.JPG')),
  :position => 2,
  :featured => false,
  :published => true)
p.photos.create(
  :title => 'The Summer House',
  :description => 'As the Summer House is nestled onto the side of a hill overlooking VilleFranche, we used local machinery and contractors to assist us with the more comprehensive structural work.',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_peter/CIMG1188.JPG')),
  :position => 3,
  :featured => false,
  :published => true)
p.photos.create(
  :title => 'The Summer House',
  :description => 'As well as preparing the area for the large swimming pool, it was placed in a perfect position to enjoy the view of the mediterranean.',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_peter/CIMG1193.JPG')),
  :position => 4,
  :featured => false,
  :published => true)
p.photos.create(
  :title => 'The Summer House',
  :description => 'Quality and beautiful materials were used throughout the build process.',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_peter/CIMG1243.JPG')),
  :position => 5,
  :featured => false,
  :published => true)
p.photos.create(
  :title => 'The Summer House',
  :description => 'Our landscape team worked wonders on the grounds, planting locally grown shrubs and fragrant herbs, vines and clematis.',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_peter/IMG_4509.JPG')),
  :position => 6,
  :featured => false,
  :published => true)
p.photos.create(
  :title => 'The Summer House',
  :description => 'The old ruin was transformed to become one of the most sought after properties in the region. Flagstone flooring and wide open spaces gave light and ambience to the internal space, whilst the provocative flavours of France were introduced in the colourscheme throughout.',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_peter/IMG_4791.JPG')),
  :position => 7,
  :featured => false,
  :published => true)
p.photos.create(
  :title => 'The Summer House',
  :description => 'Once renovated, BlackDog worked with the owner to turn the property into a thriving holiday rental business which yielded an attractive annual return. It became one of the first accredited properties, due to the exceptional standard of renovation and style.',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_peter/DSCF1187.JPG')),
  :position => 8,
  :featured => false,
  :published => true)
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
  :order_no => 1,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_graham/DSC_0075.JPG')),
  :position => 1,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_graham/DSC_0080.JPG')),
  :position => 2,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_graham/DSC_0087.JPG')),
  :position => 3,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_graham/DSC_0094.JPG')),
  :position => 4,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_graham/DSC_0099.JPG')),
  :position => 5,
  :featured => true,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_graham/DSC_0116.JPG')),
  :position => 6,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_graham/DSC_0139.JPG')),
  :position => 7,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_graham/DSC_0150.JPG')),
  :position => 8,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_graham/DSC_0154.JPG')),
  :position => 9,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_graham/DSC_0170.JPG')),
  :position => 10,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_graham/DSC_0178.JPG')),
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
  :order_no => 2,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_stuart/DSC_0228.JPG')),
  :position => 1,
  :featured => true,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_stuart/DSC_0229.JPG')),
  :position => 2,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_stuart/DSC_0230.JPG')),
  :position => 3,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_stuart/DSC_0231.JPG')),
  :position => 4,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_stuart/DSC_0233.JPG')),
  :position => 5,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_stuart/DSC_0234.JPG')),
  :position => 6,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_stuart/DSC_0235.JPG')),
  :position => 7,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_stuart/DSC_0236.JPG')),
  :position => 8,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_stuart/DSC_0237.JPG')),
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
  :order_no => 3,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0197.JPG')),
  :position => 1,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0198.JPG')),
  :position => 2,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0199.JPG')),
  :position => 3,
  :featured => true,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0200.JPG')),
  :position => 4,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0201.JPG')),
  :position => 5,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0202.JPG')),
  :position => 6,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0203.JPG')),
  :position => 7,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0204.JPG')),
  :position => 8,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0205.JPG')),
  :position => 9,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0206.JPG')),
  :position => 10,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0207.JPG')),
  :position => 11,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0208.JPG')),
  :position => 12,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0209.JPG')),
  :position => 13,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0210.JPG')),
  :position => 14,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0211.JPG')),
  :position => 15,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0212.JPG')),
  :position => 16,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0213.JPG')),
  :position => 17,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0214.JPG')),
  :position => 18,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0215.JPG')),
  :position => 19,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0216.JPG')),
  :position => 20,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0217.JPG')),
  :position => 21,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0219.JPG')),
  :position => 22,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0220.JPG')),
  :position => 23,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0221.JPG')),
  :position => 24,
  :featured => false,
  :published => true)
p.photos.create(
  :title => '',
  :description => '',
  :image => File.open(File.join(Rails.root, 'app/assets/images/properties/villa_tony/DSC_0222.JPG')),
  :position => 25,
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
  :order_no => 4,
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
  :order_no => 5,
  :featured => false,
  :published => true)
puts 'All Properties & Photos created'