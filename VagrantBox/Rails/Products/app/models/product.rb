class Product < ApplicationRecord
  validates :name, :price, :description, :imgurl, presence: true
end
