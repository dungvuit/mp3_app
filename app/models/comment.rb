class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :song

  scope :sort_by_create_at, -> {order created_at: :desc}
end
