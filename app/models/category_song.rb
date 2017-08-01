class CategorySong < ApplicationRecord
  belongs_to :category
  belongs_to :song
end
