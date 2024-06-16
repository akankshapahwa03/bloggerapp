class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :category
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  validates :title, presence: true
  validates :description, presence: true
end
