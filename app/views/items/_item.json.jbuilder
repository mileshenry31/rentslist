json.extract! item, :id, :name, :desc, :created_at, :updated_at
json.url item_url(item, format: :json)
