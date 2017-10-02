class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  before_save :downcase_email

  scope :sort_by_create_at, -> { order created_at: :desc }
  scope :search_by_name, ->(search) { where 'name LIKE ?', "%#{search}%" }
  scope :search_by_permision, ->(search_permision) {
    where is_admin: search_permision
  }

  mount_uploader :image, PictureUploader

  has_many :likes
  has_many :comments

  has_many :songs, through: :user_songs
  has_many :user_songs, dependent: :destroy

  has_many :favorite

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
      uniqueness: { case_sensitive: false }
  VALID_PASSWORD_REGEX = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/
  validates :password, presence: true,
    length: { minimum: 6 }, allow_nil: true,
    format: { with: VALID_PASSWORD_REGEX, multiline: true,
    message: 'must be at least 6 characters and
      include one number and one letter.' }
  validates :phonenumber, length: { maximum: 10 }

  class << self

    def to_csv(options = {})
      CSV.generate options do |csv|
        csv << column_names
        all.each do |user|
          csv << user.attributes.values_at(*column_names)
        end
      end
    end

    def index_users(params)
      if params[:search].present? &&
         params[:search_by_permision].present?
        User.search_by_name(params[:search])
            .search_by_permision(params[:search_by_permision])
      elsif params[:search].present?
        User.search_by_name(params[:search])
      elsif params[:search_by_permision].present?
        User.search_by_permision(params[:search_by_permision])
      else
        User.sort_by_create_at
      end.paginate page: params[:page], per_page: 5
    end
  end

  private

  def downcase_email
    email.downcase!
  end
end
