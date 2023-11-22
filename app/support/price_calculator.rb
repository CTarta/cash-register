class PriceCalculator

  def initialize(items: [])
    @items = items.compact_blank
  end

  def total_price
    return "0.00€" if items.empty?
    item_prices = items.tally.map do |item, quantity|
      PRODUCT_LOOKUP[item] * quantity
    end
    
    "%.2f" % item_prices.sum(0.00) + "€"
  end

  private

  attr_reader :items

  PRODUCT_LOOKUP = {
    "GR1" => 3.11,
    "SR1" => 5.00,
    "CF1" => 11.23
  }

end
