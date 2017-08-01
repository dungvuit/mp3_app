class Singer < ApplicationRecord
  scope :sort_by_create_at, -> {order created_at: :desc}

  has_many :songs, through: :singer_songs
  has_many :singer_songs, dependent: :destroy

  has_many :album
  mount_uploader :picture, PictureUploader

  enum gender: { male: 0, female: 1 }

end
