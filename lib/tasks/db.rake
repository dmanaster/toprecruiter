namespace :db do
  desc 'Fetch Stats on Videos'
  task :fetch_stats => :environment do
    Episode.all.each do |episode|
      uri = episode.url
      page = Nokogiri.HTML(open(uri))
      date = Date.today
      views = page.css('div.watch-view-count').text.partition(" ").first.to_i
      episode = episode
      Snapshot.create({
              :date => date,
              :views => views,
              :episode => episode,
            })
      puts Snapshot.last
    end
  end
end