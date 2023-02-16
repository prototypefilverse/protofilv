class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.references :review,       null: false, foreign_key: true
      t.integer    :e_rating,     null: false
      t.integer    :l_rating,     null: false
      t.integer    :c_rating,     null: false
      t.timestamps
    end
  end
end
