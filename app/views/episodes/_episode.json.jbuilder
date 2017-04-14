json.extract! episode, :id, :title, :url, :published, :created_at, :updated_at
json.url episode_url(episode, format: :json)
