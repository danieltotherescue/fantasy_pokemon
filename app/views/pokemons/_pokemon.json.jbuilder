json.extract! pokemon, :id, :name, :moveset, :type, :height, :weight, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)