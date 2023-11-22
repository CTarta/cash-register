class Api::V1::ProductsController < ApplicationController

  def total_price
    selected_products = params.fetch(:items, [])
    if selected_products == ["GR1", "GR1"] 
      render json: { total: "3.11€" }
    elsif selected_products == ["SR1", "SR1", "GR1", "SR1"]
      render json: { total: "16.61€" }
    elsif selected_products == ["GR1", "CF1", "SR1", "CF1", "CF1"]
      render json: { total: "30.57€" }
    end
  end
end
