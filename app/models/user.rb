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

  has_many :active_relationships, class_name: "Relationship",
    foreign_key: "follower_id",dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
    foreign_key:"followed_id",dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def follow(user)
    active_relationships.create(followed: user)
  end

  def unfollow(user)
    active_relationships.find_by(followed: user).destroy
  end

  def following?(user)
    following.include?(user)
  end
end