class CreateColumeImages < ActiveRecord::Migration[5.2]
  def change
    create_table :colume_images do |t|
    	t.integer :column_id
    	t.string :image_id

      t.timestamps
    end
  end
end
