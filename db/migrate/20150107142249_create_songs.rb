class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :song_name
      t.string :artist_name
      t.string :youtube_id
      t.integer :second_offset
      t.integer :day_of_week
      t.references :user
    end
  end
end
