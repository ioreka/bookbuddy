class Book < ApplicationRecord
  has_many :readings
  has_many :users, through: :readings

  validates :title, presence: true
  validates :author, presence: true
end
