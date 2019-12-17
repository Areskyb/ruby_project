
require('pg')

class SqlRunner
  def self.run(sql, values = [])
    begin
      db = PG.connect(dbname: 'dduheec25bigpj', host: 'ec2-174-129-254-250.compute-1.amazonaws.com',port: 5432, user: 'pbvjdbukwwofvf', password: '82b03cf361c0e3ff96ae78bb404800e011a49f20dd5e91ffc9eea948c894b0ab')
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
