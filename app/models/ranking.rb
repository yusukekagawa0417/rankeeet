class Ranking < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :items, dependent: :destroy
  belongs_to :user
end
