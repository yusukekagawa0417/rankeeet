class Item < ApplicationRecord
  belongs_to :ranking
  has_many :votes
  # accepts_nested_attributes_for :ranking_items
end
