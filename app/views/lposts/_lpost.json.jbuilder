json.extract! lpost, :id, :title, :content, :luser_id, :created_at, :updated_at
json.url lpost_url(lpost, format: :json)
