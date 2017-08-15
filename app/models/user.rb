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

  has_many :likes

  has_many :songs, through: :user_songs
  has_many :user_songs, dependent: :destroy

  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX},
      uniqueness: {case_sensitive: false}
  VALID_PASSWORD_REGEX = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/
  validates :password, presence: true,
    length: {minimum: 6}, allow_nil: true, format: {with: VALID_PASSWORD_REGEX, multiline: true,
      message: "must be at least 8 characters and include one number and one letter."}

  private

  def downcase_email
    email.downcase!
  end
end
