class Strawberry < Product

  def price_for(quantity:)
    base_price = quantity >= 3 ? discounted_price : self.price
    
    base_price * quantity
  end

  private 

  def discounted_price
    4.50
  end
end
