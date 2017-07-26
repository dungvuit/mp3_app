class Song < ApplicationRecord
  scope :sort_by_create_at, -> {order created_at: :desc}

  mount_uploader :picture, PictureUploader
  mount_uploader :url_song, AudioUploader

  has_many :relationships, as: :targetable
  has_many :categories, through: :relationships, source_type: Category.name,
    source: :ownerable
  has_many :singers, through: :relationships, source_type: Singer.name,
    source: :ownerable
  has_many :albums, through: :relationships, source_type: Album.name,
    source: :ownerable

  belongs_to :author

  validates :author, presence: false

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
