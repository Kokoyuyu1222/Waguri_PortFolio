class CreateColumnFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :column_favorites do |t|
    	t.integer :fermer_id
    	t.integer :consumer_id
    	t.integer :column_id

      t.timestamps
    end
  end
end
