json.array!(@categories) do |category|
  json.extract! category, :id, :user_id, :title
  json.url category_url(category, format: :json)
end
