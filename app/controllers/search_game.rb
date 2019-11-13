require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('../models/country')
require_relative('../models/city')
also_reload('../models/*')

get '/search-game' do


end
