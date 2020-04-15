class CreateProductComments < ActiveRecord::Migration[5.2]
  def change
    create_table :product_comments do |t|
      t.text :comment
      t.integer :consumer_id
      t.integer :product_id
      t.string :title
      t.float :rate

      t.timestamps
    end
  end
end
