class CreateReviewers < ActiveRecord::Migration[6.0]
  def change
    create_table :reviewers do |t|
      t.references :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
