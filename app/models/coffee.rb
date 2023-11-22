class Coffee < Product

  def price_for(quantity:)
    base_price = self.price
    
    if quantity >= 3
      ((base_price * quantity) * 2/3).truncate(2)
    else
      base_price * quantity
    end
  end

end
