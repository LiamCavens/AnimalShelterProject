require_relative('../db/sql_runner.rb')

class Animal

    attr_reader :id
    attr_accessor :name, :species, :breed, :age, :adoptable, :admission_date

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @name = options["name"]
        @species = options["species"]
        @breed = options["breed"]
        @age = options["age"].to_i
        @adoptable = options["adoptable"]
        @admission_date = options["admission_date"]
    end

    def save()
    sql = "INSERT INTO animals
    (
      name,
      species,
      breed,
      age,
      adoptable,
      admission_date,
      picture
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    RETURNING id"
    values = [@name, @species, @breed, @age, @adoptable, @admission_date, @picture]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
    end

    def update()
        sql = "UPDATE animals
        SET
        (
            name,
            species,
            breed,
            age,
            adoptable,
            admission_date
        ) = (
                $1, $2, $3, $4, $5, $6, $7
        ) 
        WHERE id = $8;"
        values = [@name, @species, @breed, @age, @adoptable, @admission_date, @picture, @id]
        SqlRunner.run(sql, values)
    end

    def owner()
        sql = "SELECT * FROM owners INNER JOIN adoptions ON adoptions.owner_id = owner.id WHERE adoptions.animal_id = $1;"
        values = [@id]
        results = SqlRunner.run(sql, values)
        return results.map{ |owner| Owner.new(owner)}
    end

    def self.all()
    sql = "SELECT * FROM animals"
    results = SqlRunner.run(sql)
    return results.map { |animal| Animal.new(animal) }
    end

    def self.find(id)
        sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Animal.new(results.first)
    end

    def delete()
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
    end

    def self.delete_all
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
    end

    def adoptable_yes_no()
        if @adoptable == true
        return true
    else
        return false
        end
    end

    def set_adoptable_to_false()
        @adoptable = false
    end
end