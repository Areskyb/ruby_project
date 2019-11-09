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
