class RemoveUserisFromRanking < ActiveRecord::Migration[5.2]
  def change
    remove_column :rankings, :user_id
  end
end
