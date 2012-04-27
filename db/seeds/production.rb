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

puts 'SETTING UP TEAM MEMBERS'
[
  {
    :name => 'Mark Tovey 07540 706994',
    :avatar => File.open('assets/company/profile_mark.jpg'),
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
    :avatar => File.open('assets/company/profile_ted.jpg'),
    :profile => 'Ted is a lifelong companion to Mark. He is actively involved in all aspects of Mark\'s life, acting as a constant sounding board and confidant in all aspects of the business.',
    :order_no => '2',
    :published => true
  },
  {
    :name => 'Mairead McGinley',
    :avatar => File.open('assets/company/profile_mairead.jpg'),
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

puts 'SETTING UP PROPERTY PHOTOS'
[
  {
    :title => 'The Summer House',
    :description => 'The Summer House was one of our first project renovations. Nestled in the hills just outside VilleFranche this 3 acre property was in a sad condition. Over some months we restored the property, sympathetically maintaining original features and the rustic charm which makes it such an outstanding holiday location.',
    :image => File.open('assets/properties/Villa Peter/IMG_4598.JPG'),
    :order_no => 1,
    :featured => false,
    :published => true,
    :property_id => 'villa-peter'
  },
  {
    :title => 'The Summer House',
    :description => 'We created an impressive entrance to the Summer house, using local stone and fragrant plants to line the pathways.',
    :image => File.open('assets/properties/Villa Peter/IMG_4494.JPG'),
    :order_no => 2,
    :featured => false,
    :published => true,
    :property_id => 'villa-peter'
  },
  {
    :title => 'The Summer House',
    :description => 'As the Summer House is nestled onto the side of a hill overlooking VilleFranche, we used local machinery and contractors to assist us with the more comprehensive structural work.',
    :image => File.open('assets/properties/Villa Peter/CIMG1188.JPG'),
    :order_no => 3,
    :featured => false,
    :published => true,
    :property_id => 'villa-peter'
  },
  {
    :title => 'The Summer House',
    :description => 'As well as preparing the area for the large swimming pool, it was placed in a perfect position to enjoy the view of the mediterranean.',
    :image => File.open('assets/properties/Villa Peter/CIMG1193.JPG'),
    :order_no => 4,
    :featured => false,
    :published => true,
    :property_id => 'villa-peter'
  },
  {
    :title => 'The Summer House',
    :description => 'Quality and beautiful materials were used throughout the build process.',
    :image => File.open('assets/properties/Villa Peter/CIMG1243.JPG'),
    :order_no => 5,
    :featured => false,
    :published => true,
    :property_id => 'villa-peter'
  },
  {
    :title => 'The Summer House',
    :description => 'Our landscape team worked wonders on the grounds, planting locally grown shrubs and fragrant herbs, vines and clematis.',
    :image => File.open('assets/properties/Villa Peter/IMG_4509.JPG'),
    :order_no => 6,
    :featured => false,
    :published => true,
    :property_id => 'villa-peter'
  },
  {
    :title => 'The Summer House',
    :description => 'The old ruin was transformed to become one of the most sought after properties in the region. Flagstone flooring and wide open spaces gave light and ambience to the internal space, whilst the provocative flavours of France were introduced in the colourscheme throughout.',
    :image => File.open('assets/properties/Villa Peter/IMG_4791.JPG'),
    :order_no => 7,
    :featured => false,
    :published => true,
    :property_id => 'villa-peter'
  },
  {
    :title => 'The Summer House',
    :description => 'Once renovated, BlackDog worked with the owner to turn the property into a thriving holiday rental business which yielded an attractive annual return. It became one of the first accredited properties, due to the exceptional standard of renovation and style.',
    :image => File.open('assets/properties/Villa Peter/DSCF1187.JPG'),
    :order_no => 8,
    :featured => false,
    :published => true,
    :property_id => 'villa-peter'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Graham/DSC_0075.JPG'),
    :order_no => 1,
    :featured => false,
    :published => true,
    :property_id => 'renovated-modern-villa-in-a-private-domaine'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Graham/DSC_0080.JPG'),
    :order_no => 2,
    :featured => false,
    :published => true,
    :property_id => 'renovated-modern-villa-in-a-private-domaine'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Graham/DSC_0087.JPG'),
    :order_no => 3,
    :featured => false,
    :published => true,
    :property_id => 'renovated-modern-villa-in-a-private-domaine'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Graham/DSC_0094.JPG'),
    :order_no => 4,
    :featured => false,
    :published => true,
    :property_id => 'renovated-modern-villa-in-a-private-domaine'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Graham/DSC_0099.JPG'),
    :order_no => 5,
    :featured => false,
    :published => true,
    :property_id => 'renovated-modern-villa-in-a-private-domaine'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Graham/DSC_0116.JPG'),
    :order_no => 6,
    :featured => false,
    :published => true,
    :property_id => 'renovated-modern-villa-in-a-private-domaine'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Graham/DSC_0139.JPG'),
    :order_no => 7,
    :featured => false,
    :published => true,
    :property_id => 'renovated-modern-villa-in-a-private-domaine'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Graham/DSC_0150.JPG'),
    :order_no => 8,
    :featured => false,
    :published => true,
    :property_id => 'renovated-modern-villa-in-a-private-domaine'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Graham/DSC_0154.JPG'),
    :order_no => 9,
    :featured => false,
    :published => true,
    :property_id => 'renovated-modern-villa-in-a-private-domaine'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Graham/DSC_0170.JPG'),
    :order_no => 10,
    :featured => false,
    :published => true,
    :property_id => 'renovated-modern-villa-in-a-private-domaine'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Graham/DSC_0178.JPG'),
    :order_no => 11,
    :featured => false,
    :published => true,
    :property_id => 'renovated-modern-villa-in-a-private-domaine'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Stuart/DSC_0228.JPG'),
    :order_no => 1,
    :featured => false,
    :published => true,
    :property_id => 'luxury-3-bed-villa-with-private-pool'
  }, 
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Stuart/DSC_0229.JPG'),
    :order_no => 2,
    :featured => false,
    :published => true,
    :property_id => 'luxury-3-bed-villa-with-private-pool'
  }, 
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Stuart/DSC_0230.JPG'),
    :order_no => 3,
    :featured => false,
    :published => true,
    :property_id => 'luxury-3-bed-villa-with-private-pool'
  }, 
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Stuart/DSC_0231.JPG'),
    :order_no => 4,
    :featured => false,
    :published => true,
    :property_id => 'luxury-3-bed-villa-with-private-pool'
  }, 
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Stuart/DSC_0233.JPG'),
    :order_no => 5,
    :featured => false,
    :published => true,
    :property_id => 'luxury-3-bed-villa-with-private-pool'
  }, 
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Stuart/DSC_0234.JPG'),
    :order_no => 6,
    :featured => false,
    :published => true,
    :property_id => 'luxury-3-bed-villa-with-private-pool'
  }, 
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Stuart/DSC_0235.JPG'),
    :order_no => 7,
    :featured => false,
    :published => true,
    :property_id => 'luxury-3-bed-villa-with-private-pool'
  }, 
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Stuart/DSC_0236.JPG'),
    :order_no => 8,
    :featured => false,
    :published => true,
    :property_id => 'luxury-3-bed-villa-with-private-pool'
  }, 
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Stuart/DSC_0237.JPG'),
    :order_no => 9,
    :featured => false,
    :published => true,
    :property_id => 'luxury-3-bed-villa-with-private-pool'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0197.JPG'),
    :order_no => 1,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0198.JPG'),
    :order_no => 2,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0199.JPG'),
    :order_no => 3,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0200.JPG'),
    :order_no => 4,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0201.JPG'),
    :order_no => 5,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0202.JPG'),
    :order_no => 6,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0203.JPG'),
    :order_no => 7,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0204.JPG'),
    :order_no => 8,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0205.JPG'),
    :order_no => 9,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0206.JPG'),
    :order_no => 10,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0207.JPG'),
    :order_no => 11,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0208.JPG'),
    :order_no => 12,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0209.JPG'),
    :order_no => 13,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0210.JPG'),
    :order_no => 14,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0211.JPG'),
    :order_no => 15,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0212.JPG'),
    :order_no => 16,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0213.JPG'),
    :order_no => 17,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0214.JPG'),
    :order_no => 18,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0215.JPG'),
    :order_no => 19,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0216.JPG'),
    :order_no => 20,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0217.JPG'),
    :order_no => 21,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0219.JPG'),
    :order_no => 22,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0220.JPG'),
    :order_no => 23,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0221.JPG'),
    :order_no => 24,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  },
  {
    :title => '',
    :description => '',
    :image => File.open('assets/properties/Villa Tony/DSC_0222.JPG'),
    :order_no => 25,
    :featured => false,
    :published => true,
    :property_id => '3-bed-villa-in-a-private-residence'
  }
].each do |c|
  Photo.create(c)
end
puts 'All Property Photos created'

# puts 'SETTING UP TEAM MEMBERS'
# [
#   {
#     :name => 'Mark Tovey 07540 706994',
#     :avatar => File.open('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/company/profile_mark.jpg'),
#     :profile => 'With property being a stable investment in times of uncertainty, Mark\'s ability to find the right property at the right price, whilst always being mindful of a return on your investment is unrivalled.
# 
# Mark is the founder of BlackDog Property and has realised a personal dream of finding and renovating outstanding properties in the most beautiful and prestigious area\'s of Europe.
# 
# Mark is driven for success, entrepreneurial and an accomplished businessman with a strong commercial acumen. Mark demonstrates impeccable style which is apparent throughout the projects he influences.
# 
# BlackDog Property enables others to follow their dreams in confidence, drawing on the expertise of our professional team to achieve results.
# 
# Mark is a keen golfer, skier devoted dad to Hannah, Callum and of course Ted.',
#     :order_no => '1',
#     :published => true
#   },
#   {
#     :name => 'Ted "Tiberius" Tovey',
#     :avatar => File.open('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/company/profile_ted.jpg'),
#     :profile => 'Ted is a lifelong companion to Mark. He is actively involved in all aspects of Mark\'s life, acting as a constant sounding board and confidant in all aspects of the business.',
#     :order_no => '2',
#     :published => true
#   },
#   {
#     :name => 'Mairead McGinley',
#     :avatar => File.open('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/company/profile_mairead.jpg'),
#     :profile => 'Mairead joins the BlackDog team as Associate Director based out of the VilleFranche office.
# 
# Mairead demonstrates attention to detail and meticulous planning capability when locating and negotiating properties for our clients. With a strong background in business, Mairead has perfect judgement in balancing the needs of our clients and those of the property owners - a skill which cannot be underestimated.
# 
# Mairead has extensive experience in managing luxury property s within the French Riviera and having graduated with an honours degree in International Business and Languages, she is a valued asset and support to BlackDog.
# 
# Mairead has an enthusiasm for skiing and swimming and, due to her interest in French Culture, she is well equipped to advise on exhilarating and educational activities throughout the French Riviera.',
#     :order_no => '3',
#     :published => true
#   }
# ].each do |c|
#   Member.create(c)
# end
# puts 'All Team Members created'
# 
# puts 'SETTING UP PROPERTY PHOTOS'
# [
#   {
#     :title => 'The Summer House',
#     :description => 'The Summer House was one of our first project renovations. Nestled in the hills just outside VilleFranche this 3 acre property was in a sad condition. Over some months we restored the property, sympathetically maintaining original features and the rustic charm which makes it such an outstanding holiday location.',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Peter/IMG_4598.JPG')),
#     :order_no => 1,
#     :featured => false,
#     :published => true,
#     :property_id => 'villa-peter'
#   },
#   {
#     :title => 'The Summer House',
#     :description => 'We created an impressive entrance to the Summer house, using local stone and fragrant plants to line the pathways.',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Peter/IMG_4494.JPG')),
#     :order_no => 2,
#     :featured => false,
#     :published => true,
#     :property_id => 'villa-peter'
#   },
#   {
#     :title => 'The Summer House',
#     :description => 'As the Summer House is nestled onto the side of a hill overlooking VilleFranche, we used local machinery and contractors to assist us with the more comprehensive structural work.',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Peter/CIMG1188.JPG')),
#     :order_no => 3,
#     :featured => false,
#     :published => true,
#     :property_id => 'villa-peter'
#   },
#   {
#     :title => 'The Summer House',
#     :description => 'As well as preparing the area for the large swimming pool, it was placed in a perfect position to enjoy the view of the mediterranean.',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Peter/CIMG1193.JPG')),
#     :order_no => 4,
#     :featured => false,
#     :published => true,
#     :property_id => 'villa-peter'
#   },
#   {
#     :title => 'The Summer House',
#     :description => 'Quality and beautiful materials were used throughout the build process.',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Peter/CIMG1243.JPG')),
#     :order_no => 5,
#     :featured => false,
#     :published => true,
#     :property_id => 'villa-peter'
#   },
#   {
#     :title => 'The Summer House',
#     :description => 'Our landscape team worked wonders on the grounds, planting locally grown shrubs and fragrant herbs, vines and clematis.',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Peter/IMG_4509.JPG')),
#     :order_no => 6,
#     :featured => false,
#     :published => true,
#     :property_id => 'villa-peter'
#   },
#   {
#     :title => 'The Summer House',
#     :description => 'The old ruin was transformed to become one of the most sought after properties in the region. Flagstone flooring and wide open spaces gave light and ambience to the internal space, whilst the provocative flavours of France were introduced in the colourscheme throughout.',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Peter/IMG_4791.JPG')),
#     :order_no => 7,
#     :featured => false,
#     :published => true,
#     :property_id => 'villa-peter'
#   },
#   {
#     :title => 'The Summer House',
#     :description => 'Once renovated, BlackDog worked with the owner to turn the property into a thriving holiday rental business which yielded an attractive annual return. It became one of the first accredited properties, due to the exceptional standard of renovation and style.',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Peter/DSCF1187.JPG')),
#     :order_no => 8,
#     :featured => false,
#     :published => true,
#     :property_id => 'villa-peter'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Graham/DSC_0075.JPG')),
#     :order_no => 1,
#     :featured => false,
#     :published => true,
#     :property_id => 'renovated-modern-villa-in-a-private-domaine'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Graham/DSC_0080.JPG')),
#     :order_no => 2,
#     :featured => false,
#     :published => true,
#     :property_id => 'renovated-modern-villa-in-a-private-domaine'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Graham/DSC_0087.JPG')),
#     :order_no => 3,
#     :featured => false,
#     :published => true,
#     :property_id => 'renovated-modern-villa-in-a-private-domaine'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Graham/DSC_0094.JPG')),
#     :order_no => 4,
#     :featured => false,
#     :published => true,
#     :property_id => 'renovated-modern-villa-in-a-private-domaine'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Graham/DSC_0099.JPG')),
#     :order_no => 5,
#     :featured => false,
#     :published => true,
#     :property_id => 'renovated-modern-villa-in-a-private-domaine'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Graham/DSC_0116.JPG')),
#     :order_no => 6,
#     :featured => false,
#     :published => true,
#     :property_id => 'renovated-modern-villa-in-a-private-domaine'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Graham/DSC_0139.JPG')),
#     :order_no => 7,
#     :featured => false,
#     :published => true,
#     :property_id => 'renovated-modern-villa-in-a-private-domaine'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Graham/DSC_0150.JPG')),
#     :order_no => 8,
#     :featured => false,
#     :published => true,
#     :property_id => 'renovated-modern-villa-in-a-private-domaine'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Graham/DSC_0154.JPG')),
#     :order_no => 9,
#     :featured => false,
#     :published => true,
#     :property_id => 'renovated-modern-villa-in-a-private-domaine'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Graham/DSC_0170.JPG')),
#     :order_no => 10,
#     :featured => false,
#     :published => true,
#     :property_id => 'renovated-modern-villa-in-a-private-domaine'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Graham/DSC_0178.JPG')),
#     :order_no => 11,
#     :featured => false,
#     :published => true,
#     :property_id => 'renovated-modern-villa-in-a-private-domaine'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Stuart/DSC_0228.JPG')),
#     :order_no => 1,
#     :featured => false,
#     :published => true,
#     :property_id => 'luxury-3-bed-villa-with-private-pool'
#   }, 
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Stuart/DSC_0229.JPG')),
#     :order_no => 2,
#     :featured => false,
#     :published => true,
#     :property_id => 'luxury-3-bed-villa-with-private-pool'
#   }, 
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Stuart/DSC_0230.JPG')),
#     :order_no => 3,
#     :featured => false,
#     :published => true,
#     :property_id => 'luxury-3-bed-villa-with-private-pool'
#   }, 
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Stuart/DSC_0231.JPG')),
#     :order_no => 4,
#     :featured => false,
#     :published => true,
#     :property_id => 'luxury-3-bed-villa-with-private-pool'
#   }, 
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Stuart/DSC_0233.JPG')),
#     :order_no => 5,
#     :featured => false,
#     :published => true,
#     :property_id => 'luxury-3-bed-villa-with-private-pool'
#   }, 
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Stuart/DSC_0234.JPG')),
#     :order_no => 6,
#     :featured => false,
#     :published => true,
#     :property_id => 'luxury-3-bed-villa-with-private-pool'
#   }, 
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Stuart/DSC_0235.JPG')),
#     :order_no => 7,
#     :featured => false,
#     :published => true,
#     :property_id => 'luxury-3-bed-villa-with-private-pool'
#   }, 
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Stuart/DSC_0236.JPG')),
#     :order_no => 8,
#     :featured => false,
#     :published => true,
#     :property_id => 'luxury-3-bed-villa-with-private-pool'
#   }, 
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Stuart/DSC_0237.JPG')),
#     :order_no => 9,
#     :featured => false,
#     :published => true,
#     :property_id => 'luxury-3-bed-villa-with-private-pool'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0197.JPG')),
#     :order_no => 1,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0198.JPG')),
#     :order_no => 2,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0199.JPG')),
#     :order_no => 3,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0200.JPG')),
#     :order_no => 4,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0201.JPG')),
#     :order_no => 5,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0202.JPG')),
#     :order_no => 6,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0203.JPG')),
#     :order_no => 7,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0204.JPG')),
#     :order_no => 8,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0205.JPG')),
#     :order_no => 9,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0206.JPG')),
#     :order_no => 10,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0207.JPG')),
#     :order_no => 11,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0208.JPG')),
#     :order_no => 12,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0209.JPG')),
#     :order_no => 13,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0210.JPG')),
#     :order_no => 14,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0211.JPG')),
#     :order_no => 15,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0212.JPG')),
#     :order_no => 16,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0213.JPG')),
#     :order_no => 17,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0214.JPG')),
#     :order_no => 18,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0215.JPG')),
#     :order_no => 19,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0216.JPG')),
#     :order_no => 20,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0217.JPG')),
#     :order_no => 21,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0219.JPG')),
#     :order_no => 22,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0220.JPG')),
#     :order_no => 23,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0221.JPG')),
#     :order_no => 24,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   },
#   {
#     :title => '',
#     :description => '',
#     :image => File.open(File.join('https://s3-eu-west-1.amazonaws.com/bdp-assets/images/properties/', 'Villa+Tony/DSC_0222.JPG')),
#     :order_no => 25,
#     :featured => false,
#     :published => true,
#     :property_id => '3-bed-villa-in-a-private-residence'
#   }
# ].each do |c|
#   Photo.create(c)
# end
# puts 'All Property Photos created'