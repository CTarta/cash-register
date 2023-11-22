require "rails_helper"

RSpec.describe Coffee, type: :model do
  describe "#price_for" do
    let!(:coffee) { described_class.find_by(code: "CF1") } 
    it "reduces the price to 2/3 of the original based on quantity" do
      expect(coffee.price_for(quantity: 1)).to eq 11.23
      expect(coffee.price_for(quantity: 2)).to eq 22.46
      expect(coffee.price_for(quantity: 3)).to eq 22.46
      expect(coffee.price_for(quantity: 4)).to eq 29.94
    end
  end
end
