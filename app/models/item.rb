class Item < ApplicationRecord
  belongs_to :ranking
  has_many :votes, dependent: :destroy
  # accepts_nested_attributes_for :ranking_items
end
