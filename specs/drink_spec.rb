require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')

class DrinkTest < Minitest::Test

  def test_drink_name
    @drink1 = Drink.new("Tennents Lager", 2)
    assert_equal("Tennents Lager", @drink1.drink_name)
  end

  def test_drink_price
    @drink1 = Drink.new("Tennents Lager", 2)
    assert_equal(2, @drink1.price)
  end
end
