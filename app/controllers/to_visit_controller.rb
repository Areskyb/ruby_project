require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('../models/country')
also_reload('../models/*')

get '/to-visit' do
@countries = Country.all()
erb(:"to_visit/index")
end
