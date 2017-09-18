class Song < ApplicationRecord
  scope :sort_by_create_at, -> {order created_at: :desc}
  scope :top, -> {(order count_view: :desc).limit(10)}

  mount_uploader :picture, PictureUploader
  mount_uploader :file_song, AudioUploader

  validates :name, presence: true, length: { maximum: 50 }
  validates_presence_of :picture
  validates_presence_of :file_song
  validates :content, presence: true

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
  has_many :comments

  #Favorite Song
  has_many :favorites, through: :favorite_songs
  has_many :favorite_songs, dependent: :destroy

  scope :search_song_client, -> search{ where "name LIKE ?", "%#{search}" }

  scope :search_song, -> song_name, singer_name, category_name, author_name do
    where("songs.name LIKE ?","%#{song_name}%")
    .joins(:singers).where("singers.name LIKE ?", "%#{singer_name}%")
    .joins(:categories).where("categories.name LIKE ?", "%#{category_name}%")
    .joins(:author).where "authors.name LIKE ?","%#{author_name}%"
  end

  def liked? user
    likes.where(user_id: user.id).present?
  end

  def commented? user
    comments.where(user_id: user.id).present?
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
