class Singer < ApplicationRecord
  has_many :album
  has_many :relationships, as: :ownerable
  has_many :songs, through: :active_relationships, source_type: Song.name,
    source: :targetable
  mount_uploader :picture, PictureUploader
end
