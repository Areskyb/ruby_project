require('sinatra')
require('sinatra/contrib/all') if development?
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

#DELETE
get '/visited/:country_id/delete' do
@country = Country.find_by_id(params[:country_id])
@country.delete
redirect to('/visited')
end



# CITIES

 get '/visited/:country_id/:city_id' do
   @country = Country.find_by_id(params[:country_id].to_i)
   @city = City.find_by_id(params[:city_id].to_i)
  erb(:"to_visit/city")
end
