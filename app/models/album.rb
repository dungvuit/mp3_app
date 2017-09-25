class Album < ApplicationRecord
  scope :sort_by_create_at, -> { order created_at: :desc }
  scope :search_by_name, ->(search) { where 'name LIKE ?', "%#{search}%" }
  scope :limit_display, -> { (order created_at: :desc).limit(5) }

  validates :name, presence: true
  validates_presence_of :picture

  mount_uploader :picture, PictureUploader

  belongs_to :singer

  has_many :songs, through: :album_songs
  has_many :album_songs, dependent: :destroy

  has_many :categories, through: :album_categories
  has_many :album_categories, dependent: :destroy

  class << self
    def to_csv(options = {})
      CSV.generate options do |csv|
        csv << column_names
        all.each do |album|
          csv << album.attributes.values_at(*column_names)
        end
      end
    end

    def index_albums(params)
      if params[:search].present?
        Album.search_by_name(params[:search])
      else
        Album.sort_by_create_at
      end.paginate page: params[:page], per_page: 5
    end
  end
end
