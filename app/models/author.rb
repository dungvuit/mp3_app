class Author < ApplicationRecord
  scope :sort_by_create_at, -> {order created_at: :desc}
  scope :search_by_name, -> search {where "name LIKE ?", "%#{search}%"}

  has_many :songs

  class << self
    def to_csv options = {}
      CSV.generate options do |csv|
        csv << column_names
        all.each do |author|
          csv << author.attributes.values_at(*column_names)
        end
      end
    end
  end
end
