class CreateFilvs < ActiveRecord::Migration[6.0]
  def change
    create_table :filvs do |t|
      #t.references :user,         null: false, foreign_key: true
      #t.references :reviewer,     null: false, foreign_key: true
      t.integer    :strength,     null: false, default: 1
      t.integer    :intelligence, null: false, default: 1
      t.integer    :charisma,     null: false, default: 1
      t.timestamps
    end
  end
end
