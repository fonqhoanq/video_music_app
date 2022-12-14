json.array! @videos do |video|
    json.id video.id
    json.title video.title
    json.description video.description
    json.singer_id video.singer_id
    json.created_at video.created_at
    json.public video.public
    json.views video.views
    json.url url_for(video.url) if video.url.attached?
  end