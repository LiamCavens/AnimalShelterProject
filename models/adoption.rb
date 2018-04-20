require_relative('../db/sql_runner.rb')

class Adoption

    attr_reader :id, :animal_id, :owner_id

    def initialize(options)
        @id = options["id"].to_i
        @animal_id = options["id"].to_i
        @owner_id = options["id"].to_i
        @date = options["date"]
    end
end