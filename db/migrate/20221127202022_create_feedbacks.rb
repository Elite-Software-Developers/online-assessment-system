class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.string :content
      t.references :user, not_null: true, foreign_key: true
      t.references :question, not_null: true, foreign_key: true

      t.timestamps
    end
  end
end
