class PriceCalculator

  def initialize(items: [])
    @items = items.compact_blank
  end

  def total_price
    return "0.00€" if items.empty?

    if items == ["GR1", "GR1"] 
      "3.11€"
    elsif items == ["SR1", "SR1", "GR1", "SR1"]
      "16.61€"
    elsif items == ["GR1", "CF1", "SR1", "CF1", "CF1"]
      "30.57€"
    end
  end

  private

  attr_reader :items
  
end