class Item < ApplicationRecord
  belongs_to :ranking
  has_many :votes, dependent: :destroy  
  validates :name, presence: true
end
