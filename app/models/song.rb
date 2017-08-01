class Song < ApplicationRecord
  scope :sort_by_create_at, -> {order created_at: :desc}

  mount_uploader :picture, PictureUploader
  mount_uploader :url_song, AudioUploader

  # Categories_Song
  has_many :categories, through: :category_songs
  has_many :category_songs, dependent: :destroy

  # Singer_Song
  has_many :singers, through: :singer_songs
  has_many :singer_songs, dependent: :destroy

  # Album_Song
  has_many :albums, through: :album_songs
  has_many :album_songs, dependent: :destroy

  belongs_to :author

  class << self
    def to_csv options = {}
      CSV.generate options do |csv|
        csv << column_names
        all.each do |song|
          csv << song.attributes.values_at(*column_names)
        end
      end
    end
  end
end
