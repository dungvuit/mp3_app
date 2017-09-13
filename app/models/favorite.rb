class Favorite < ApplicationRecord
  belongs_to :user

  has_many :songs, through: :favorite_songs
  has_many :favorite_songs, dependent: :destroy

  before_save :capitalize_name

  def capitalize_name
    name.capitalize!
  end

  def favorited? song
    favorite_songs.where(song_id: song.id).present?
  end
end
