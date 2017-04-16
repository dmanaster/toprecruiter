hashes = [
  {
    title: "Episode 1 - Youtube",
    url: "https://www.youtube.com/watch?v=2YzM4ZXnJvU",
    published: "Apr 10, 2017".to_date,
    source: "youtube"
  },
  {
    title: "Episode 1 - Facebook",
    url: "https://www.facebook.com/toprecruitertv/videos/vb.195576537163412/1307086426012412/?type=2&theater",
    published: "Apr 10, 2017".to_date,
    source: "facebook"
  }]

hashes.each do |hash|
  Episode.find_or_create_by(hash)
end
