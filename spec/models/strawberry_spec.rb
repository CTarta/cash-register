require "rails_helper"

RSpec.describe Strawberry, type: :model do
  describe "#price_for" do
    let!(:strawberry) { described_class.find_by(code: "SR1") } 
    it "reduces the individual item price to 4.50 depending on quantity" do
      expect(strawberry.price_for(quantity: 1)).to eq 5.00
      expect(strawberry.price_for(quantity: 2)).to eq 10.00
      expect(strawberry.price_for(quantity: 3)).to eq 13.50
      expect(strawberry.price_for(quantity: 4)).to eq 18.00
    end
  end
end
