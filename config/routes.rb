Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products, only: [] do
        get :total_price, on: :collection
      end
    end
  end
end
