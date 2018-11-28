class Pub

attr_reader :pub_name, :till, :customers, :drinks

  def initialize(pub_name, customers, drinks)
    @pub_name = pub_name
    @till = 0
    @customers = customers
    @drinks = drinks
  end

  def sell_drink(customer,drink)
    @drinks.delete(drink)
    @till += drink.price
    customer.buy_drink(drink)
    
  end
end
