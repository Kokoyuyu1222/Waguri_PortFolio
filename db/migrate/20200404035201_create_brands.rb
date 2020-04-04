class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
    	t.string :name
    	t.string :category_id
    	t.integer :brand_status,defolut: 0

      t.timestamps
    end
  end
end
