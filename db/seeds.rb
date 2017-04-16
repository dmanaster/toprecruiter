# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

episodes = Episode.create([
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
  }
  ])