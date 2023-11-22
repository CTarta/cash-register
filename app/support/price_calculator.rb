class PriceCalculator

  def initialize(items: [])
    @items = items.compact_blank
  end

  def total_price
    return "0.00€" if items.empty?
    items.map do |item|
      PRODUCT_LOOKUP[item]
    end
  end

  private

  attr_reader :items

  PRODUCT_LOOKUP = {
    "GR1" => "3.11€",
    "SR1" => "5.00€",
    "CF1" => "11.23€"
  }

end
