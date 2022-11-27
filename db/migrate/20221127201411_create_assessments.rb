class CreateAssessments < ActiveRecord::Migration[7.0]
  def change
    create_table :assessments do |t|
      t.string :title
      t.date :start_date
      t.integer :duration
      t.date :end_date

      t.timestamps
    end
  end
end
