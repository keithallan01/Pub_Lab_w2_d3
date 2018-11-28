require('minitest/autorun')
require('minitest/rg')
require_relative('../customer')

class CustomerTest < Minitest::Test

  def test_customer_has_name
    @customer1 = Customer.new("Tom", 50)
    assert_equal("Tom", @customer1.customer_name)
  end

  def test_customer_has_wallet
    @customer1 = Customer.new("Tom", 50)
    assert_equal(50, @customer1.wallet)
  end

end
