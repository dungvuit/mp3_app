class Song < ApplicationRecord
  scope :sort_by_create_at, -> {order created_at: :desc}

  mount_uploader :picture, PictureUploader
  mount_uploader :url_song, AudioUploader

  # belongs_to :author
  has_many :singer
  has_many :category

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
