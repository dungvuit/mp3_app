class Song < ApplicationRecord
  scope :sort_by_create_at, -> {order created_at: :desc}
  scope :top, -> {(order count_view: :desc).limit(10)}

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

  # User_Song
  has_many :users, through: :user_songs
  has_many :user_songs, dependent: :destroy

  belongs_to :author
  has_many :likes

  scope :search_song, -> song_name, singer_name, category_name, author_name do
    where("songs.name LIKE ?","%#{song_name}%")
    .joins(:singers).where("singers.name LIKE ?", "%#{singer_name}%")
    .joins(:categories).where("categories.name LIKE ?", "%#{category_name}%")
    .joins(:author).where "authors.name LIKE ?","%#{author_name}%"
  end

  def liked? user
    likes.where(user_id: user.id).present?
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
