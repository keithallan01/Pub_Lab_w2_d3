class Customer

  attr_reader :customer_name, :wallet, :age

  def initialize(customer_name, wallet, age)
    @customer_name = customer_name
    @wallet = wallet
    @age = age
  end

  def reduce_wallet(debit)
    @wallet -= debit
      # return wallet
  end

  def buy_drink(desired_drink)
    reduce_wallet(desired_drink.price)
  end

  def afford_drink(drink)
    return drink.price < @wallet
  end

end
