require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../customer')
require_relative('../drink')
class PubTest < Minitest::Test


  def setup
    @customer1 = Customer.new("Tom", 50)
    @customer2 = Customer.new("Keith",20)
    @customers =[@customer1, @customer2]

    @drink1 = Drink.new("Tennents Lager", 2)
    @drink2 = Drink.new("Red Wine", 3)
    @drink3 = Drink.new("Mojito", 5)
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

  def test_pub_sell_drink__customer_wallet_decrease
    @pub.sell_drink(@customer2,@drink3)
    assert_equal(15,@customer2.wallet)
  end

end
