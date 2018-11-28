require('minitest/autorun')
require('minitest/rg')
require_relative('../customer')
require_relative('../drink')


class CustomerTest < Minitest::Test

  def setup
    @customer1 = Customer.new("Tom", 50)
  end

  def test_customer_has_name
    assert_equal("Tom", @customer1.customer_name)
  end

  def test_customer_has_wallet
    assert_equal(50, @customer1.wallet)
  end

  def test_reduce_wallet
    assert_equal(48, @customer1.reduce_wallet(2))
  end

  def test_buy_drink
    @drink1 = Drink.new("Tennents Lager", 2)
    assert_equal(48, @customer1.buy_drink(@drink1))
  end

end
