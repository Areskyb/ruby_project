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
erb(:"new/index")
end
