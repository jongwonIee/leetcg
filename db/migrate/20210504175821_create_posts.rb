class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :code
      t.string :hashtag
      t.string :description
      t.integer :price
      t.string :language
      t.string :condition
      t.integer :stock
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
