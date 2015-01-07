require 'parse-ruby-client'

namespace :songs do
  desc 'Update main nomex site with user song preferences'
  task update: :environment do

    Parse.init :application_id => 'LoHZgNGxGeLK0m8KC4LkTgGmB4zFZ4LMAibpjuIj',
               :api_key        => 'HaWVagREouPIe950tKuyrp1K3mcgYBVtlJLSDI9X',
               :quiet          => false

    User.all.each do |user|
      Parse::User.authenticate(user.nomex_username, user.nomex_password)

      all_songs_query = Parse::Query.new('Song')
      all_songs_query.eq('user', user.name)
      song = all_songs_query.get.first
      todays_song = user.todays_song

      song['name']   = todays_song.song_name
      song['artist'] = todays_song.artist_name
      song['startAtInSeconds'] = todays_song.second_offset
      song['youtubeId'] = todays_song.youtube_id

      song.save
    end


  end

end
