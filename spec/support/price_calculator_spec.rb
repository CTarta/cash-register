require "rails_helper"

RSpec.describe PriceCalculator do
  let(:calculator) { described_class.new(items: items) }
  describe "#total_price" do
    context "When the items in the cart are: GR1" do
      let(:items) { ["GR1"] }
      it "returns 3.11€" do
        expect(calculator.total_price).to eq "3.11€"
      end 
    end
    
    context "When the items in the cart are: SR1" do
      let(:items) { ["SR1"] }
      it "returns 5.00€" do
        expect(calculator.total_price).to eq "5.00€"
      end 
    end
    
    context "When the items in the cart are: CF1" do
      let(:items) { ["CF1"] }
      it "returns 11.23€" do
        expect(calculator.total_price).to eq "11.23€"
      end 
    end

    context "When the items in the cart are: GR1, GR1" do
      let(:items) { ["GR1", "GR1"] }
      it "returns 3.11€" do
        expect(calculator.total_price).to eq "3.11€"
      end 
    end
    
    context "When the items in the cart are: GR1, GR1, GR1" do
      let(:items) { ["GR1", "GR1", "GR1"] }
      it "returns 3.11€" do
        expect(calculator.total_price).to eq "6.22€"
      end 
    end

    context "When the items in the cart are: SR1, SR1, GR1, SR1" do
      let(:items) { ["SR1", "SR1", "GR1", "SR1"] }
      it "returns 16.61€" do
        expect(calculator.total_price).to eq "16.61€"
      end   
    end
    
    context "When the items in the cart are: SR1, SR1, GR1, SR1, GR1" do
      let(:items) { ["SR1", "SR1", "GR1", "SR1", "GR1"] }
      it "returns 16.61€" do
        expect(calculator.total_price).to eq "16.61€"
      end   
    end

    context "When the items in the cart are: GR1, CF1, SR1, CF1, CF1" do
      let(:items) { ["GR1", "CF1", "SR1", "CF1", "CF1"] }
      it "returns 30.57€" do
        expect(calculator.total_price).to eq "30.57€"
      end 
    end

    context "When there are no items in the cart" do
      let(:items) { [] }
      it "returns 0.00€" do
        expect(calculator.total_price).to eq "0.00€"
      end 
    end
  end
end
