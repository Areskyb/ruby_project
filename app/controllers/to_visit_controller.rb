require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('../models/country')
also_reload('../models/*')

get '/to-visit' do
@countries = Country.all()
erb(:"to_visit/index")
end

get '/to-visit/:id' do
  @country = Country.find_by_id(params[:id].to_i)
  @cities_in_country = @country.cities()

  erb(:"to_visit/country")
end

post '/to-visit/:id' do
  params[:country_id] = params[:id].to_i
  @country = Country.find_by_id(params[:id].to_i)
  @city = City.new(params)
  @city.save()
  @cities_in_country = @country.cities()
  erb(:"to_visit/country")
end

# CITIES
