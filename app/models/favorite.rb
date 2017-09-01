class Favorite < ApplicationRecord
  belongs_to :user

  has_many :favorites, through: :favorite_songs
  has_many :favorite_songs, dependent: :destroy
end
