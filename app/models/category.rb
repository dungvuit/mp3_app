class Category < ApplicationRecord
  scope :limit_display, -> { (order created_at: :desc).limit(5) }

  validates :name, presence: true

  before_save :capitalize_name

  has_many :songs, through: :category_songs
  has_many :category_songs, dependent: :destroy

  has_many :albums, through: :album_categories
  has_many :album_categories, dependent: :destroy

  scope :sort_by_create_at, -> { order created_at: :desc }
  scope :search_by_name, ->(search) { where 'name LIKE ?', "%#{search}%" }

  def capitalize_name
    name.capitalize!
  end

  class << self
    def to_csv(options = {})
      CSV.generate options do |csv|
        csv << column_names
        all.each do |category|
          csv << category.attributes.values_at(*column_names)
        end
      end
    end

    def index_categories(params)
      if params[:search].present?
        Category.search_by_name(params[:search])
      else
        Category.sort_by_create_at
      end.paginate page: params[:page], per_page: 5
    end
  end
end
