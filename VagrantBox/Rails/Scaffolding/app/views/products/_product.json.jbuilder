json.extract! product, :id, :name, :price, :description, :imgurl, :created_at, :updated_at
json.url product_url(product, format: :json)
