class User < ApplicationRecord
  has_many :readings
  has_many :books, through: :readings

  has_many :follower_followings, class_name: "Following", foreign_key: "follower_id"
  has_many :followees, through: :follower_followings, class_name: "User"

  has_many :followee_followings, class_name: "Following", foreign_key: "followee_id"
  has_many :followers, through: :followee_followings, class_name: "User"

  has_many :comments
  has_many :commented_readings, class_name: "Reading", through: :comments

  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :password, presence: true, length: { in: 3..20 }

end
