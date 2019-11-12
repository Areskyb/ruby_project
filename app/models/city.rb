require_relative('../db/sql_runner.rb')

class City
  attr_accessor :name,:country_id,:visited
  attr_reader :id

  def initialize(options)
    @name = options['name'].split.each{|i| i.capitalize!}.join(' ')
    @country_id = options['country_id'].to_i
    @visited = options['visited']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "INSERT INTO cities (name,country_id,visited) VALUES ($1,$2,$3) RETURNING id"
    values = [@name,@country_id,@visited]
    result = SqlRunner.run(sql,values)[0]
    @id = result['id'].to_i
  end

    def update
      sql = "UPDATE cities SET (name,visited) = ($1,$2) WHERE id = $3"
      values = [@name,@visited,@id]
      SqlRunner.run(sql,values)
    end

    def delete()
      sql = 'DELETE FROM cities WHERE id = $1'
      values = [@id]
      SqlRunner.run(sql,values)
    end

    def toggle_visit
      @visited == false  ? @visited = true : @visited = false
      self.update()
    end

    def self.all
      sql = 'SELECT * FROM cities'
      result = SqlRunner.run(sql)
      return result.map{|x| City.new(x)}
    end

  def self.delete_all()
    sql = 'DELETE FROM cities'
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = 'SELECT * FROM cities WHERE id = $1'
    values = [id]
    return City.new(SqlRunner.run(sql,values).first)
  end

end
