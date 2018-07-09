class User < ApplicationRecord
  has_many :readings
  has_many :books, through: :readings

  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :password, presence: true, length: { in: 3..20 }

end
