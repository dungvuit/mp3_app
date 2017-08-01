class User < ApplicationRecord
  attr_accessor :remember_token
  before_save :downcase_email

  scope :sort_by_create_at, -> {order created_at: :desc}
  scope :search_by_name, -> search{where "name LIKE ?", "%#{search}%"}
  scope :search_by_permision, -> search_permision{where is_admin: search_permision}

  mount_uploader :image, PictureUploader

  has_secure_password

  private

  def downcase_email
    email.downcase!
  end
end
