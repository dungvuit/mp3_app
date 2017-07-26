class Album < ApplicationRecord
  belongs_to :singer
  has_many :relationships, as: :ownerable
  has_many :songs, through: :relationships,
    source_type: Song.name, source: :targetable
end
