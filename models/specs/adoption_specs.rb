require('minitest/autorun')
require('minitest/rg')
require_relative('../adoption.rb')
require_relative('../animal.rb')
require_relative('../owner.rb')

class AdoptionTest < MiniTest::Test

    def setup()
        @animal1 = Animal.new(
            "name" => "Stevie",
            "species" => "Lizard",
            "breed" => "Argus Monitor",
            "age" => 2,
            "adoptable" => true,
            "admission_date" => "2018-02-03"
            )
        @owner1 = Owner.new(
            "first_name" => "Liam",
            "last_name" => "Cavens"
            )
        @adoption = Adoption.new(
            "animal_id" => @animal1.id(),
            "owner_id" => @owner1.id(),
            "date" => "2018-03-14"
            )
    end

    def test_adoption_date()
        assert_equal("2018-03-14", @adoption.date)
    end

    def test_owner_id_is_1()
        assert_equal(1, @adoption.owner_id)
    end
end