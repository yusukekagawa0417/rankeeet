class AddRankingid < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :ranking, foreign_key: true
  end
end
