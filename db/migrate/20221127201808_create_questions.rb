class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :question
      t.references :assessment, not_null: true, foreign_key: true 
      t.integer :correct_answer_id

      t.timestamps
    end
  end
end
