require('minitest/autorun')
require('minitest/rg')
require_relative('../animal.rb')

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
end