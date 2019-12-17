require('sinatra')
require('sinatra/contrib/all') if development?
require('pry')

require_relative('../models/country')
require_relative('../models/city')
# also_reload('../models/*')

get '/search-game' do
@city = City.random_city()
@city_name = @city['name']
@country_code = @city['countrycode']
@population = @city['population']
@country = City.find_wcountry_by_code(@country_code)
@country_name = @country['name']
@continent = @country['continent']
erb(:"search_game/index")
end

get '/search_game/result' do
@result = params['result']
@answer = params['answer']

 erb(:"search_game/conclussion")

end
