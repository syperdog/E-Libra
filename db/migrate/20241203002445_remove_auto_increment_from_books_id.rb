class RemoveAutoIncrementFromBooksId < ActiveRecord::Migration[8.0]
  def change
    change_column :books, :id, :integer, null: false, default: nil
  end
end
