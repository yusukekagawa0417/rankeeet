class DeleteNameUniqIndexFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :name, :string
  end
end
