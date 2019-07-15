class AddRankingidToVotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :votes, :ranking, foreign_key: true
  end
end
