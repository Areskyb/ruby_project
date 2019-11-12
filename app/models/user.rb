require_relative('country')
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

def save
  sql = "INSERT INTO users (name,age,origin_city) VALUES ($1,$2,$3) RETURNING id"
  values = [@name,@age,@origin_city]
  result = SqlRunner.run(sql,values)[0]
  @id = result['id'].to_i
end

def action(options)
  @city_id = options['city_id'].to_i
  @visited = options['visited']
  @images = options['images']
  @description = options['description']
  options['id'] = @id

  sql = 'INSERT INTO actions (user_id,city_id,visited,img,description)
        VALUES ($1,$2,$3,$4,$5) RETURNING id'
  values = [@id,@city_id,@visited,@images,@description]
  result = SqlRunner.run(sql,values)[0]
end

  def self.delete_all()
    sql = 'DELETE FROM users'
    SqlRunner.run(sql)
  end

end
