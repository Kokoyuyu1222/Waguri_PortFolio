class CreateBookMarks < ActiveRecord::Migration[5.2]
  def change
    create_table :book_marks do |t|
      t.references :consumer, null:false
      t.references :fermer, null:false
      t.timestamps null: false
    end
  end
end
