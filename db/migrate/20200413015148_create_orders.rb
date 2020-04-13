class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :consumer_id
      t.integer :order_status, default: 0
      t.integer :payment_method
      t.string :name
      t.string :phone
      t.integer :postcode
      t.integer :prefecture_code
      t.string :address_city
      t.string :address_street
      t.string :address_building
      t.integer :postage, default: 800
      t.integer :billing_amount
      t.string :address

      t.timestamps
    end
  end
end
