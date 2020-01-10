class User < ApplicationRecord
  validates :name, presence: true
  validates :age, numericality: true
  validates :from, presence: true
  validates :email, presence: true
  
  has_secure_password
  
  has_many :items
  has_many :likes
  has_many :like_items, through: :likes, source: 'item'
  has_many :comments
end
