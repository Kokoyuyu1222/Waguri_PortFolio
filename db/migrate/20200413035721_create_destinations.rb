class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.integer :consumer_id
      t.integer :postcode
      t.string :name
      t.integer :prefecture_code
      t.string :address_city
      t.string :address_street
      t.string :address_building
      t.string :address

      t.timestamps
    end
  end
end
