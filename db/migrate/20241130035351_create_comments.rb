class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.string :username
      t.text :body
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
