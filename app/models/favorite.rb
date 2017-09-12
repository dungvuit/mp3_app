class Favorite < ApplicationRecord
  belongs_to :user

  has_many :songs, through: :favorite_songs
  has_many :favorite_songs, dependent: :destroy

  before_save :capitalize_name

  def capitalize_name
    name.capitalize!
  end

  def song_favorited? song
    songs.pluck(:id).include?(song.id)
  end
end
