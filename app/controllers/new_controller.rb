require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('../models/country')

get '/new' do
  'hello'
  erb(:"new/index")
end

post '/new' do
@country = Country.new(params)
@country.name = @country.name.split.each{|i| i.capitalize!}.join(' ')
@country.save()
@visited = @country.visited == 't' ? 'visited' : 'to-visit'
erb(:"new/index")
end

#COUNTRY EDIT AND DELETE

get '/visited/:country_id/edit' do
  erb(:"new/edit")
end

post '/visited/:country_id/edit' do
  @country = Country.find_by_id(params[:country_id].to_i)
  erb(:"new/edit")
end

post '/to-visit/:country_id/edit' do
  @country = Country.find_by_id(params[:country_id].to_i)
  erb(:"new/edit")
end

post '/update' do
@country = Country.find_by_id(params['id'])
@old_name = @country.name
@country.name = params['name']
@country.visited = params['visited']
@country.delete_cities if @old_name != params['name']
@country.update
redirect to ("/visited") if !@country.visited
redirect to ("/to-visit") if @country.visited
end
#CITY EDIT AND DELETE

get '/visited/:country_id/:city_id/delete' do
  @city = City.find_by_id(params[:city_id].to_i)
  @city.delete()
  redirect to ("/visited/#{params[:country_id]}")
end

get '/to-visit/:country_id/:city_id/delete' do
  @city = City.find_by_id(params[:city_id].to_i)
  @city.delete()
  redirect to ("/to-visit/#{params[:country_id]}")
end
