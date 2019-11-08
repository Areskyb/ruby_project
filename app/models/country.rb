require_relative('city')
require_relative('../db/sql_runner.rb')

class Country
  attr_accessor :name,:visited
  attr_reader :id

  def initialize(options)
    @name = options['name'].capitalize
    @visited = options['visited']
    @id = options['id'].to_i if options['id']
  end

  def delete()
    sql = 'DELETE FROM countries WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def save
    sql = "INSERT INTO countries (name,visited) VALUES ($1,$2) RETURNING id"
    values = [@name,@visited]
    result = SqlRunner.run(sql,values)[0]
    @id = result['id'].to_i
  end

  def update
    sql = "UPDATE countries SET (name,visited) = ($1,$2) WHERE id = $3"
    values = [@name,@visited, @id]
    SqlRunner.run(sql,values)
  end

  def toggle_visit
    @visited == false  ? @visited = true : @visited = false
    self.update()
  end

  def self.delete_all()
    sql = 'DELETE FROM countries'
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = 'SELECT * FROM countries WHERE id = $1'
    values = [id]
    return Country.new(SqlRunner.run(sql,values).first)
  end

  def cities()
    sql = 'SELECT * FROM cities WHERE country_id = $1'
    values = [@id]
    result = SqlRunner.run(sql,values)
    return result.map{|city| City.new(city)}
  end



end
