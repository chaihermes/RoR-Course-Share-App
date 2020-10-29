json.extract! product, :id, :product, :title, :description, :author, :price, :image, :created_at, :updated_at
json.url product_url(product, format: :json)
