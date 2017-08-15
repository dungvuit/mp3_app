class Category < ApplicationRecord

  before_save :capitalize_name

  has_many :songs, through: :category_songs
  has_many :category_songs, dependent: :destroy

  scope :sort_by_create_at, -> {order created_at: :desc}
  scope :search_by_name, -> search {where "name LIKE ?", "%#{search}%"}

  def capitalize_name
    name.capitalize!
  end

  class << self
    def to_csv options = {}
      CSV.generate options do |csv|
        csv << column_names
        all.each do |category|
          csv << category.attributes.values_at(*column_names)
        end
      end
    end
  end
end
