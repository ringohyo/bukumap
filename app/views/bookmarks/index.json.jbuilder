json.array!(@bookmarks) do |bookmark|
  json.extract! bookmark, :id, :title, :url, :category_id
  json.url bookmark_url(bookmark, format: :json)
end
