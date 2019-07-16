class Item < ApplicationRecord
  belongs_to :ranking
  has_many :votes, dependent: :destroy  
end
