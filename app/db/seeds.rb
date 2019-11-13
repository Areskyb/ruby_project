# frozen_string_literal: true

require('pry')

require_relative('../models/city.rb')
require_relative('../models/country.rb')
require_relative('../models/user.rb')

Country.delete_all
City.delete_all
User.delete_all

spain = Country.new('name' => 'Spain', 'visited' => true)
uk = Country.new('name' => 'united kingdom', 'visited' => true)
france = Country.new('name' => 'france', 'visited' => false)
andorra = Country.new('name' => 'andorra', 'visited' => true)
us = Country.new('name' => 'United States', 'visited' => true)
angola = Country.new('name' => 'Angola', 'visited' => false)
aruba = Country.new('name' => 'Aruba', 'visited' => true)
bahamas = Country.new('name' => 'Bahamas', 'visited' => false)
chile = Country.new('name' => 'chile', 'visited' => true)
belgium = Country.new('name' => 'Belgium', 'visited' => false)
dominica= Country.new('name' => 'Dominica', 'visited' => true)


andorra.save
uk.save
france.save
spain.save
us.save
angola.save
aruba.save
bahamas.save
chile.save
belgium.save
dominica.save

seville = City.new('name' => 'Seville', 'visited' => true, 'country_id' => spain.id)
palma = City.new('name' => 'palma', 'visited' => false, 'country_id' => spain.id)
paris = City.new('name' => 'paris', 'visited' => true, 'country_id' => france.id)
les_termes = City.new('name' => 'les_termes', 'visited' => false, 'country_id' => france.id)
cambridge = City.new('name' => 'cambridge', 'visited' => false, 'country_id' => uk.id)
edimburgh = City.new('name' => 'edimburgh', 'visited' => true, 'country_id' => uk.id)
la_bella = City.new('name' => 'la bella', 'visited' => false, 'country_id' => andorra.id)

seville.save
palma.save
paris.save
les_termes.save
cambridge.save
edimburgh.save
la_bella.save

user1 = User.new('name' => 'Aresky', 'age' => 21, 'origin_city' => 'Baleares')
user1.save

user1.action('city_id' => seville.id, 'visited' => true, 'images' => ['https://www.bru-system.be/media/cache/resolve/babe_banner_filter/uploads/cover-image/2019-01/banner-sevilla.jpg'], 'description' => 'This is seville, the best of the best of spain')

binding.pry
return uk
nil
