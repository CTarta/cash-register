require "rails_helper"

RSpec.describe GreenTea, type: :model do
  describe "#price_for" do
    let!(:green_tea) { described_class.find_by(code: "GR1") }
    it "applies two for one discounts based on the quantity" do
      expect(green_tea.price_for(quantity: 1)).to eq 3.11
      expect(green_tea.price_for(quantity: 2)).to eq 3.11
      expect(green_tea.price_for(quantity: 3)).to eq 6.22
      expect(green_tea.price_for(quantity: 4)).to eq 6.22
    end
  end
end
