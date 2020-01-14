class Item < ApplicationRecord
  validates :user_id, presence: true
  validates :product, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :image, presence: true
  
  validates :product, length: {maximum: 40 }
  validates :description, length: {maximum: 500}
  
  belongs_to :user
  has_many :likes
  has_many :like_users, through: :likes, source: 'user'
  has_many :comments
  
  
  mount_uploader :image, ImageUploader
end
