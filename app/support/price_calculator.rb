class PriceCalculator

  def initialize(items: [])
    @items = items.compact_blank
  end

  def total_price
    return "0.00€" if items.empty?
    
    "%.2f" % item_prices.sum(0.00) + "€"
  end

  private

  attr_reader :items

  PRODUCT_LOOKUP = {
    "GR1" => 3.11,
    "SR1" => 5.00,
    "CF1" => 11.23
  }

  def item_prices 
    items.tally.map do |code, quantity|
      item_price(code, quantity)
    end
  end
  
  def item_price(code, quantity)
    item = Product.find_by(code: item)
    return 0.00 unless item
    price = item.price
    
    if item == "GR1"
      price * (quantity/2) + price * (quantity%2)
    elsif item == "SR1"
      price = 4.50 if quantity >= 3
      price * quantity
    elsif item == "CF1"
      if quantity >= 3
        (price * quantity) * 2/3
      else
        price * quantity
      end
    end
  end

end
