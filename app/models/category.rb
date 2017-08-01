class Category < ApplicationRecord
  has_many :songs, through: :category_songs
  has_many :category_songs, dependent: :destroy

  scope :sort_by_create_at, -> {order created_at: :desc}
  scope :search_by_name, -> search {where "name LIKE ?", "%#{search}%"}

end
