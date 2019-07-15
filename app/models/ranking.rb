class Ranking < ApplicationRecord
  has_many :votes
  has_many :items
  belongs_to :user
end
