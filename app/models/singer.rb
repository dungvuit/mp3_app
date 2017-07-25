class Singer < ApplicationRecord
  has_many :song
  has_many :album

  mount_uploader :picture, PictureUploader
end
