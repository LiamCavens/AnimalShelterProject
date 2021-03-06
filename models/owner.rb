require_relative('../db/sql_runner.rb')

class Owner

    attr_reader :id
    attr_accessor :first_name, :last_name

    def initialize(options)
        @id= options["id"].to_i
        @first_name = options["first_name"]
        @last_name = options["last_name"]  
    end

     def save()
    sql = "INSERT INTO owners
    (
      first_name,
      last_name
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@first_name, @last_name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
    end

    def self.all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run(sql)
    return results.map { |owner| Owner.new(owner) }
    end

    def self.find(id)
        sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Owner.new(results.first)
    end

    def self.delete_all
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
    end

    def delete()
    sql = "DELETE FROM owners
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
    end

  def animals()
      sql = "SELECT animals.* FROM animals INNER JOIN adoptions ON animals.id = adoptions.animal_id  WHERE adoptions.owner_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |animal| Animal.new(animal)}
  end
end