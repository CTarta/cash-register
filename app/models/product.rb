class Product < ApplicationRecord
  validates_presence_of :code, :name, :price
  validates :price, numericality: { greater_than: 0 }, allow_nil: true

  def price_for(quantity:)
    base_price = self.price
    if code == "GR1"
      base_price * (quantity/2) + base_price * (quantity%2)
    elsif code == "SR1"
      base_price = 4.50 if quantity >= 3
      base_price * quantity
    elsif code == "CF1"
      if quantity >= 3
        ((base_price * quantity) * 2/3).truncate(2)
      else
        base_price * quantity
      end
    end
  end
end
