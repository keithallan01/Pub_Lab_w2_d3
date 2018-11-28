require('minitest/autorun')
require('minitest/rg')
require_relative('../customer')
require_relative('../drink')


class CustomerTest < Minitest::Test

  def setup
    @customer1 = Customer.new("Tom", 50, 31)
    @customer3 = Customer.new("Cricket", 1, 45)
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
    @drink1 = Drink.new("Tennents Lager", 2, 4)
    assert_equal(48, @customer1.buy_drink(@drink1))
  end

  def test_customer_can_afford_drink__true
    @drink1 = Drink.new("Tennents Lager", 2, 4)
    assert_equal(true, @customer1.afford_drink(@drink1))
  end

  def test_customer_can_afford_drink__false
    @drink1 = Drink.new("Tennents Lager", 2, 4)
    assert_equal(false, @customer3.afford_drink(@drink1))
  end

  def test_customer_has_age
    assert_equal(31, @customer1.age)
  end

  def test_customer_drunkenness
    assert_equal(0, @customer1.drunkenness)
  end

  def test_get_drunker
    @drink1 = Drink.new("Tennents Lager", 2, 4)
    assert_equal(4, @customer1.get_drunker(@drink1))
  end

end
