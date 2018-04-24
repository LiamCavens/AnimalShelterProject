require('minitest/autorun')
require('minitest/rg')
require_relative('../owner.rb')

class OwnerTest < MiniTest::Test

    def setup()
        @owner1 = Owner.new(
            "first_name" => "Liam",
            "last_name" => "Cavens"
        )
    end

    def test_name()
        assert_equal("Liam", @owner1.first_name)
    end
end