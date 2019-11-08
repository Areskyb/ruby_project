# frozen_string_literal: true

require('pry')

require_relative('../models/city.rb')
require_relative('../models/country.rb')

Country.delete_all
City.delete_all

spain = Country.new('name' => 'Spain', 'visited' => true)
uk = Country.new('name' => 'uk', 'visited' => true)
france = Country.new('name' => 'france', 'visited' => true)
andorra = Country.new('name' => 'andorra', 'visited' => true)

andorra.save
uk.save
france.save
spain.save

seville = City.new('name' => 'Seville','visited' => true,'country_id' => spain.id)
palma = City.new('name' => 'palma','visited' => false,'country_id' => spain.id)
paris = City.new('name' => 'paris','visited' => true,'country_id' => france.id)
les_termes = City.new('name' => 'les_termes','visited' => true,'country_id' => france.id)
cambridge = City.new('name' => 'cambridge','visited' => false,'country_id' => uk.id)
edimburgh = City.new('name' => 'edimburgh','visited' => true,'country_id' => uk.id)
la_bella = City.new('name' => 'la bella','visited' => false,'country_id' => andorra.id)

seville.save()
palma.save()
paris.save()
les_termes.save()
cambridge.save()
edimburgh.save()
la_bella.save()

binding.pry

nil
