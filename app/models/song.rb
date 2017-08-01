class Song < ApplicationRecord
  scope :sort_by_create_at, -> {order created_at: :desc}

  mount_uploader :picture, PictureUploader
  mount_uploader :url_song, AudioUploader

  has_many :categories, through: :category_songs
  has_many :category_songs, dependent: :destroy
  has_many :singers, through: :singer_songs
  has_many :singer_songs, dependent: :destroy

  belongs_to :author

end
