class CreateCorrectAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :correct_answers do |t|
      t.string :content
      t.references :question, not_null: true, foreign_key: true

      t.timestamps
    end
  end
end
