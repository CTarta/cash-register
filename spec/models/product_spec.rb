require "rails_helper"

RSpec.describe Product, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
  end

  describe "#price_for" do
    it "simply multiplies the price and the quantity" do 
      product = Product.new(price: 10.00)
      expect(product.price_for(quantity: 3)).to eq 30
    end
  end
end
