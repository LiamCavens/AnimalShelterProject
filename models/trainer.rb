require_relative('../db/sql_runner.rb')

class Trainer

    def initialize(options)
        @id= options["id"].to_i
        @first_name = options["first_name"]
        @last_name = options["last_name"]
        @fav_species = options["fav_species"]
    end
end