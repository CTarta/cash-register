require "rails_helper"

RSpec.describe "Api::V1::Products", type: :request do
  describe "GET /total_price" do
    context "When the cart contains only two green teas" do
      it "applies a buy-one-get-one-free offer for green tea" do
        cart_items = ["GR1", "GR1"]
        get total_price_api_v1_products_path, params: { items: cart_items }
        
        expect(JSON.parse(response.body)).to eq({ "total" => "3.11€" })
        expect(response.status).to eq(200)
      end
    end

    context "When the cart contains at least three strawberries" do
      it "applies a 0.50€ price discount for each item" do
        cart_items = ["SR1", "SR1", "GR1", "SR1"]
        get total_price_api_v1_products_path, params: { items: cart_items }
        
        expect(JSON.parse(response.body)).to eq({ "total" => "16.61€" })
        expect(response.status).to eq(200)
      end
    end

    context "When the cart contains at least three coffees" do
      it "the price for all coffees drops to 2/3 of the original" do
        cart_items = ["GR1", "CF1", "SR1", "CF1", "CF1"]
        get total_price_api_v1_products_path, params: { items: cart_items }
        
        expect(JSON.parse(response.body)).to eq({ "total" => "30.57€" })
        expect(response.status).to eq(200)
      end
    end
    
    context "When the cart is empty" do
      it "the total price is 0" do
        cart_items = []
        get total_price_api_v1_products_path, params: { items: cart_items }
        
        expect(JSON.parse(response.body)).to eq({ "total" => "0.00€" })
        expect(response.status).to eq(200)
      end
    end
  end
end
