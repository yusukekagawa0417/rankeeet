class CreateRankings < ActiveRecord::Migration[5.2]
  def change
    create_table :rankings do |t|
      t.string :name, null: false, unique: true, index: true
      # t.references :user, foreign_key: true
      t.string :user_id, null: false
      t.timestamps
    end
  end
end
