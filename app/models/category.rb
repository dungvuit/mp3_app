class Category < ApplicationRecord
  scope :sort_by_create_at, -> {order created_at: :desc}
  scope :search_by_name, -> search {where "name LIKE ?", "%#{search}%"}

  has_many :relationships, as: :ownerable
  has_many :songs, through: :relationships,
    source_type: Song.name, source: :targetable

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
