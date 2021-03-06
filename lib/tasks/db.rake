namespace :db do
  desc 'Fetch Stats on Videos'
  task :fetch_stats => :environment do
    Episode.all.each do |episode|
      if episode.source == "youtube"
        uri = episode.url
        page = Nokogiri.HTML(open(uri))
        date = Date.today
        if page.css('div.watch-view-count').text.split(" ").first
          views = page.css('div.watch-view-count').text.split(" ").first.delete(',').to_i
          Snapshot.create({
                  :date => date,
                  :views => views,
                  :episode => episode
                })
        end
      elsif episode.source == "facebook"
        uri = episode.url
        page = Nokogiri.HTML(open(uri))
        date = Date.today
        if page.xpath("//code").first
          snippet = page.xpath("//code").first.children.first.text
          snippet = snippet.split('_1vx9').last
          snippet[0..7] = ''
          views = snippet.split(" Views").first.delete(',').to_i
          Snapshot.create({
                  :date => date,
                  :views => views,
                  :episode => episode
                })
        end
      end
    end
  end
  desc 'Retry Fetch Stats on Videos'
  task :retry_stats => :environment do
    Episode.all.each do |episode|
      snapshot = episode.snapshots.last
      if snapshot.views == 0
        if episode.source == "youtube"
          uri = episode.url
          page = Nokogiri.HTML(open(uri))
          date = Date.today
          if page.css('div.watch-view-count').text.split(" ").first
            views = page.css('div.watch-view-count').text.split(" ").first.delete(',').to_i
            snapshot.views = views
            snapshot.save
          end
        elsif episode.source == "facebook"
          uri = episode.url
          page = Nokogiri.HTML(open(uri))
          date = Date.today
        if page.xpath("//code").first
            snippet = page.xpath("//code").first.children.first.text
            snippet = snippet.split('_1vx9').last
            snippet[0..7] = ''
            views = snippet.split(" Views").first.delete(',').to_i
            snapshot.views = views
            snapshot.save
          end
        end
      end
    end
  end
end