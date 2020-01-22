class Comment < ApplicationRecord
  validates :content, presence: true
  validates :content, length: { maximum: 30 }
  
  belongs_to :user
  belongs_to :item
end
