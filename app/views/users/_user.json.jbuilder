json.extract! user, :id, :Name, :Photo, :Bio, :post_counter, :timestamp, :created_at, :updated_at
json.url user_url(user, format: :json)