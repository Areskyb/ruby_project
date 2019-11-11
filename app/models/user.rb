require_relative('county')
require_relative('city')
require_relative('../db/sql_runner.rb')

class User
  attr_reader :id
  attr_accessor :name, :age, :origin_city

  def initialize(options)
    @name = options['name']
    @age = options['age'].to_i
    @origin_city = options['origin_city']
    @id = options['id'].to_i if options['id']
end

def action(options)
  @user_id = @id
  @city_id = options['city_id'].to_i
  @visited = optinos['visited']
  @images = options['images']
  @description = options['descriptions']
  @id = options['id'].to_i if options['id']
  sql = 'INSERT INTO actions (user_id,city_id,visited,img,description)
        VALUES ($1,$2,$3,$4,$5) RETURNING id'
  values = [@user_id,@city_id,@visited,@images,@description]
  result = SqlRunner.run(sql,values)[0]
end
