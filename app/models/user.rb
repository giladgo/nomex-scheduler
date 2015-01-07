class User < ActiveRecord::Base
  has_many :songs

  def todays_song
    self.songs.where(day_of_week: DateTime.now.wday).first
  end
end
