class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.string :quantity
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
