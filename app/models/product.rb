class Product < ApplicationRecord
  validates_presence_of :code, :name, :price
  validates :price, numericality: { greater_than: 0 }, allow_nil: true
end
