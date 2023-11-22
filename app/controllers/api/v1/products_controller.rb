class Api::V1::ProductsController < ApplicationController

  def total_price
    selected_products = params.fetch(:items, [])
    price_calculator = PriceCalculator.new(items: selected_products)
    
    render json: { total: price_calculator.total_price }
  end
end
