class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :ranking
end
