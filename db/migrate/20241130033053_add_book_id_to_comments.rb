class AddBookIdToComments < ActiveRecord::Migration[8.0]
  def change
    add_reference :comments, :book, null: false, foreign_key: true
  end
end
