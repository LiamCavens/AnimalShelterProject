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
        @picture = options["picture"]  
    end
end