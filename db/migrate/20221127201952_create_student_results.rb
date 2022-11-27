class CreateStudentResults < ActiveRecord::Migration[7.0]
  def change
    create_table :student_results do |t|
      t.string :score
      t.date :assessment_date
      t.references :assessment, not_null: true, foreign_key: true
      t.references :user, not_null: true, foreign_key: true

      t.timestamps
    end
  end
end
