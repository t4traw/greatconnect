class User < ApplicationRecord
  validates :name, presence: true
  validates :age, numericality: true
  validates :from, presence: true
  validates :email, presence: true
  
  validates :password, length: {minmum: 8, maximum: 32}
  validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/ }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z]+\.[a-z]+\z/i }
  validates :name, length: { maximum: 15 }
  
  has_secure_password
  
  has_many :items
  has_many :likes
  has_many :like_items, through: :likes, source: 'item'
  has_many :comments
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries
end
