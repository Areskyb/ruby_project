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
@country.save()
@cities = Array.new
@visited = @country.visited ? 'visited' : 'to-visit'
erb(:"new/index")
end
