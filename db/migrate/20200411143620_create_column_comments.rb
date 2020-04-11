class CreateColumnComments < ActiveRecord::Migration[5.2]
  def change
    create_table :column_comments do |t|
      t.text :comment
      t.integer :fermer_id
      t.integer :consumer_id
      t.integer :column_id

      t.timestamps
    end
  end
end
