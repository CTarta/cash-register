require "rails_helper"

RSpec.describe Product, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
  end

  describe "#price_for" do
    context "When the item is Green Tea" do
      let!(:green_tea) { described_class.find_by(code: "GR1") }
      it "applies two for one discounts based on the quantity" do
        expect(green_tea.price_for(quantity: 1)).to eq 3.11
        expect(green_tea.price_for(quantity: 2)).to eq 3.11
        expect(green_tea.price_for(quantity: 3)).to eq 6.22
        expect(green_tea.price_for(quantity: 4)).to eq 6.22
      end
    end

    context "When the item is Strawberries" do
      let!(:strawberries) { described_class.find_by(code: "SR1") } 
      it "reduces the individual item price to 4.50 depending on quantity" do
        expect(strawberries.price_for(quantity: 1)).to eq 5.00
        expect(strawberries.price_for(quantity: 2)).to eq 10.00
        expect(strawberries.price_for(quantity: 3)).to eq 13.50
        expect(strawberries.price_for(quantity: 4)).to eq 18.00
      end
    end

    context "When the item is Coffee" do
      let!(:coffee) { described_class.find_by(code: "CF1") } 
      it "reduces the price to 2/3 of the original based on quantity" do
        expect(coffee.price_for(quantity: 1)).to eq 11.23
        expect(coffee.price_for(quantity: 2)).to eq 22.46
        expect(coffee.price_for(quantity: 3)).to eq 22.46
        expect(coffee.price_for(quantity: 4)).to eq 29.94
      end
    end
  end
end
