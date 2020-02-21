class User < ApplicationRecord
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length:{ minimum: 6 }
  mount_uploader :avatar, AvatarUploader
  
  has_many :lessons

  def took_lesson(category)
    lessons.find_by(category: category)
  end
end