class CreateFilvs < ActiveRecord::Migration[6.0]
  def change
    create_table :filvs do |t|
      t.text    :avatar_image
      t.integer :strength
      t.integer :intelligence
      t.integer :charisma
      t.timestamps
    end
  end
end
