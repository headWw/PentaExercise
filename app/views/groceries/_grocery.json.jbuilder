json.extract! grocery, :id, :name, :quantity, :user_id, :created_at, :updated_at
json.url grocery_url(grocery, format: :json)
