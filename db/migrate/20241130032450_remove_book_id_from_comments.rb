class RemoveBookIdFromComments < ActiveRecord::Migration[8.0]
  def change
    remove_column :comments, :books_id, :integer
  end
end
