class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.references :user,         null: false, foreign_key: true
      t.references :review,       null: false, foreign_key: true
      t.float      :e_rating,     null: false
      t.float      :l_rating,     null: false
      t.float      :c_rating,     null: false
      t.timestamps
    end
  end
end
