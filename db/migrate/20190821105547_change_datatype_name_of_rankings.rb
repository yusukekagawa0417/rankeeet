class ChangeDatatypeNameOfRankings < ActiveRecord::Migration[5.2]
  def change
    change_column :rankings, :name, :string, unique: true, null: false
  end
end
