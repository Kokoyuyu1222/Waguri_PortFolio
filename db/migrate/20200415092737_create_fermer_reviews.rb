class CreateFermerReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :fermer_reviews do |t|

      t.timestamps
    end
  end
end
