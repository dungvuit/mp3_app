class User < ApplicationRecord
  attr_accessor :remember_token
  before_save :downcase_email

  mount_uploader :image, PictureUploader

  has_secure_password

  def remember
    self.remember_token = User.new_token
    update_attributes remember_digest: User.digest(remember_token)
  end

  def authenticated? attribute, token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password? token
  end

  def forget
    update_attributes remember_digest: nil
  end

  def current_user? current_user
    self == current_user
  end

  def authenticated? attribute, token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password? token
  end

  class << self
    def new_token
      SecureRandom.urlsafe_base64
    end

    def digest string
      cost = ActiveModel::SecurePassword.min_cost ?
        BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create string, cost: cost
    end
  end

  private
  def downcase_email
    email.downcase!
  end
end
