require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('../models/country')
require_relative('../models/city')
also_reload('../models/*')

get '/visited' do
  @countries = Country.all
  erb(:"visited/index")
end

get '/visited/:id' do
  @country = Country.find_by_id(params[:id].to_i)
  @cities_in_country = @country.cities()

  erb(:"visited/country")
end

post '/visited/:id' do
  params[:country_id] = params[:id].to_i
  @country = Country.find_by_id(params[:id].to_i)
  @city = City.new(params)
  @city.save()
  @cities_in_country = @country.cities()
  erb(:"visited/country")
end
