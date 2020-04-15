class CreateFermerReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :fermer_reviews do |t|
      t.text :comment
      t.integer :consumer_id
      t.integer :fermer_id
      t.string :title
      t.float :rate

      t.timestamps
    end
  end
end
