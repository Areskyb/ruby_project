
require('pg')

class SqlRunner
  def self.run(sql, values = [])
    begin
      db = PG.connect(dbname: 'world', host: 'localhost')
      db.prepare('query', sql)
      result = db.exec_prepared('query', values)
    ensure
      db&.close
    end
    result
  end
end


class WholeWorldSqlRunner
  def self.run(sql, values = [])
    begin
      db = PG.connect(dbname: 'whole_world', host: 'localhost')
      db.prepare('query', sql)
      result = db.exec_prepared('query', values)
    ensure
      db&.close
    end
    result
  end
end
