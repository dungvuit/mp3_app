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

  # scope :search_song, -> song_name {where "name LIKE ?", "%#{song_name}%"}

  # scope :search_song, -> song_name, singer_name, category_name, author_name do
  #   scope = where("songs.name LIKE ?", "%#{song_name}%")
  #   if singer_name.present?
  #     scope = scope.joins(:singers).where("singers.name LIKE ?", "%#{singer_name}%")
  #   end
  #   if category_name.present?
  #     scope = scope.joins(:categories).where("categories.name LIKE ?", "%#{category_name}%")
  #   end
  #   if author_name.present?
  #     scope = scope.joins(:author).where("authors.name LIKE ?", "%#{author_name}%")
  #   end
  #   # scope
  # end

  scope :search_song, -> song_name, singer_name, category_name, author_name do
    where("songs.name LIKE ?","%#{song_name}%")
    .joins(:singers).where("singers.name LIKE ?", "%#{singer_name}%")
    .joins(:categories).where("categories.name LIKE ?", "%#{category_name}%")
    .joins(:author).where "authors.name LIKE ?","%#{author_name}%"
  end

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
