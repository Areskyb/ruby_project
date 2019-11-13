require('sinatra')
require('sinatra/contrib/all')

require_relative('controllers/to_visit_controller')
require_relative('controllers/visited_controller')
require_relative('controllers/new_controller')
require_relative('controllers/search_game')


get '/' do
  erb(:index)
end

get '/delete_all' do
  Country.delete_all()
  redirect to ('/')
end
