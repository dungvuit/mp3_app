class Singer < ApplicationRecord
  scope :sort_by_create_at, -> {order created_at: :desc}

  has_many :songs, through: :singer_songs
  has_many :singer_songs, dependent: :destroy

  has_many :album
  mount_uploader :picture, PictureUploader

  enum gender: { male: 0, female: 1 }

  class << self
    def to_csv options = {}
      CSV.generate options do |csv|
        csv << column_names
        all.each do |singer|
          csv << singer.attributes.values_at(*column_names)
        end
      end
    end
  end
end
