class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :reviewer,       null: false, foreign_key: true
      t.references :movie,          null: false, foreign_key: true
      t.string     :review_title,   null: false  
      t.text       :review_content, null: false
      t.float      :e_rating,       null: false, default: 0
      t.float      :l_rating,       null: false, default: 0
      t.float      :c_rating,       null: false, default: 0
      t.timestamps
    end
  end
end
