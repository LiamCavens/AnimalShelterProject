require('minitest/autorun')
require('minitest/rg')
require_relative('../animal.rb')
require_relative('../owner.rb')
require_relative('../adoption.rb')

class AnimalTest < MiniTest::Test

    def setup()
        @animal = Animal.new(   
            "name" => "Stevie",
            "species" => "Lizard",
            "breed" => "Argus Monitor",
            "age" => 2,
            "adoptable" => true,
            "admission_date" => "2018-02-03"
        )
        @owner = Owner.new(
            "first_name" => "Liam",
            "last_name" => "Cavens"
        )
        @adoption = Adoption.new(
            "animal_id" => @animal.id(),
            "owner_id" => @owner.id(),
            "date" => "2018-03-14"
        )
    end

    def test_name()
        assert_equal("Stevie", @animal.name)
    end

    def test_age()
        assert_equal(2, @animal.age)
    end

    def test_adoptable()
        assert_equal(true, @animal.adoptable)
    end

    def test_adoptable_yes_no()
        assert_equal("Yes", @animal.adoptable_yes_no())
    end

    def test_set_adoptable()
        @animal.set_adoptable_to_false()
        assert_equal(false, @animal.adoptable)
    end
end