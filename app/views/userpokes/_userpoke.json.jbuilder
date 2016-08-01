json.extract! userpoke, :id, :pokemon_id, :user_id, :created_at, :updated_at
json.url userpoke_url(userpoke, format: :json)