require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')

class PubTest < Minitest::Test


  def setup
    @pub = Pub.new("Earl of Banterbury")
  end

  def test_pub_has_name
    assert_equal("Earl of Banterbury", @pub.pub_name)
  end

  def test_pub_has_no_money
    assert_equal(0, @pub.till)
  end
end
