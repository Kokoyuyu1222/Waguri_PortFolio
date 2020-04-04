class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.string :name
    	t.integer :iamge_id
    	t.integer :brand_id
    	t.integer :category_id
    	t.integer :quantity
    	t.integer :stock_id
    	t.integer :fermer_id
    	t.integer :sale_status,defolut: 0
    	t.integer :unit_price


      t.timestamps
    end
  end
end
