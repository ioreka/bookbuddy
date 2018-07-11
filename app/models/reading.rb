class Reading < ApplicationRecord
  belongs_to :user
  belongs_to :book

  has_many :comments
  has_many :commenters, class_name: "User", through: :comments
end
