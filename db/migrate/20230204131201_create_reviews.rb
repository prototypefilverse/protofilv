class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :reviewer,       null: false, foreign_key: true
      t.references :movie,          null: false, foreign_key: true
      t.string     :review_title,   null: false  
      t.text       :review_content, null: false
      t.timestamps
    end
  end
end
