require('minitest/autorun')
require('minitest/rg')
require_relative('../trainer.rb')

class TrainerTest < MiniTest::Test

    def setup()
        @trainer1 = Trainer.new(
            "first_name" => "Liam",
            "last_name" => "Cavens"
        )
    end

    def test_name()
        assert_equal("Liam", @trainer1.first_name)
    end
end