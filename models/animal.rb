require_relative('../db/sql_runner.rb')

class Animal

    attr_reader :id
    attr_accessor :name, :species, :breed, :age, :adoptable, :picture

    def initialize(options)
        @id= options["id"].to_i
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
      admission_date
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @species, @breed, @age, @adoptable]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
    end
end