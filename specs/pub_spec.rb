require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../customer')
require_relative('../drink')
class PubTest < Minitest::Test


  def setup
    @customer1 = Customer.new("Tom", 50, 31)
    @customer2 = Customer.new("Keith",20, 30)
    @customer3 = Customer.new("Cricket", 1, 45)
    @customer4 = Customer.new("Juan", 25, 16)
    @customers =[@customer1, @customer2, @customer3]

    @drink1 = Drink.new("Tennents Lager", 2, 4)
    @drink2 = Drink.new("Red Wine", 3, 5)
    @drink3 = Drink.new("Mojito", 5, 6)
    @drinks = [@drink1,@drink2,@drink3]


    @pub = Pub.new("Earl of Banterbury",@customers,@drinks)
  end

  def test_pub_has_name
    assert_equal("Earl of Banterbury", @pub.pub_name)
  end

  def test_pub_has_no_money
    assert_equal(0, @pub.till)
  end

  def test_pub_has_customers
    assert_equal(@customers, @pub.customers)
  end

  def test_pub_has_drinks
    assert_equal(@drinks, @pub.drinks)
  end

  def test_pub_sell_drink_stock_reduced
    @pub.sell_drink(@customer2,@drink3)
    assert_equal([@drink1, @drink2], @pub.drinks)
  end

  def test_pub_sell_drink__till_increased
    @pub.sell_drink(@customer2,@drink3)
    assert_equal(5,@pub.till)
  end

  def test_pub_sell_drink__till_increased__sold_twice
    @pub.sell_drink(@customer2,@drink3)
    @pub.sell_drink(@customer2,@drink3)
    assert_equal(5,@pub.till)
  end

  def test_pub_sell_drink__customer_wallet_decrease
    @pub.sell_drink(@customer2,@drink3)
    assert_equal(15,@customer2.wallet)
  end

  def test_pub_sell_drink__customer_wallet_decrease__sold_twice
    @pub.sell_drink(@customer2,@drink3)
    @pub.sell_drink(@customer2,@drink3)
    assert_equal(15,@customer2.wallet)
  end

  # def test_customer_has_sufficient_funds__suffiecient_funds
  #   @pub.sell_drink(@customer2,@drink1)
  #   assert_equal(18,@customer2.wallet)
  # end

  def test_customer_has_sufficient_funds__insuffiecient_funds
    @pub.sell_drink(@customer3,@drink2)
    assert_equal(1,@customer3.wallet)
  end

  def test_checks_id__true
    assert_equal(true, @pub.check_id(@customer2))
  end

  def test_checks_id__false
    assert_equal(false, @pub.check_id(@customer4))
  end

  def test_sell_underager_drink
    @pub.sell_drink(@customer4, @drink1)
    assert_equal(25, @customer4.wallet)
  end

  def test_sell_drink__drunkenness_increases
    assert_equal(4, @customer1.drunkenness)
  end
end
