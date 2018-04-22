require_relative('../db/sql_runner.rb')

class Trainer

    attr_reader :id, :first_name, :last_name, :fav_species

    def initialize(options)
        @id = options["id"].to_i
        @first_name = options["first_name"]
        @last_name = options["last_name"]
        @fav_species = options["fav_species"]
        @animals = []
    end

     def save()
    sql = "INSERT INTO trainers
    (
      first_name,
      last_name,
      fav_species
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@first_name, @last_name, @fav_species]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
    end

    def self.all()
    sql = "SELECT * FROM trainers"
    results = SqlRunner.run(sql)
    return results.map { |trainer| Trainer.new(trainer) }
    end

    def self.find(id)
        sql = "SELECT * FROM trainers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Trainer.new(results.first)
    end

    def self.delete_all
    sql = "DELETE FROM trainers"
    SqlRunner.run(sql)
  end
end