class Product < ApplicationRecord
  validates_presence_of :code, :name, :price
  validates :price, numericality: { greater_than: 0 }, allow_nil: true

  def price_for(quantity:)
    if code == "GR1"
      price * (quantity/2) + price * (quantity%2)
    elsif code == "SR1"
      price = 4.50 if quantity >= 3
      price * quantity
    elsif code == "CF1"
      if quantity >= 3
        (price * quantity) * 2/3
      else
        price * quantity
      end
    end
  end
end
