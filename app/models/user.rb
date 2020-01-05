class User < ApplicationRecord
  validates :name, presence: true
  validates :age, numericality: true
  validates :from, presence: true
  validates :email, presence: true
  
  has_secure_password
end
