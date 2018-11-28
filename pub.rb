class Pub

attr_reader :pub_name, :till, :customers, :drinks

  def initialize(pub_name, customers, drinks)
    @pub_name = pub_name
    @till = 0
    @customers = customers
    @drinks = drinks
  end

  def sell_drink(customer,drink)

    if @drinks.include?(drink) && customer.afford_drink(drink) && check_id(customer)
      @drinks.delete(drink)
      @till += drink.price
      customer.get_drunker(drink)
      customer.buy_drink(drink)
    end
  end

  def check_id(customer)
    return customer.age > 18
  end

end
