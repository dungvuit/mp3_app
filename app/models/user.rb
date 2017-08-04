class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :downcase_email

  scope :sort_by_create_at, -> {order created_at: :desc}
  scope :search_by_name, -> search{where "name LIKE ?", "%#{search}%"}
  scope :search_by_permision, -> search_permision{where is_admin: search_permision}

  mount_uploader :image, PictureUploader

  private

  def downcase_email
    email.downcase!
  end
end
