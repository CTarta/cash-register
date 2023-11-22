class GreenTea < Product

  def price_for(quantity:)
    base_price = self.price
    
    base_price * (quantity/2) + base_price * (quantity%2)
  end
end
