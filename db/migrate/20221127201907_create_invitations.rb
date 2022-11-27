class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.string :link
      t.references :user, not_null: true, foreign_key: true 
      t.references :assessment, not_null: true, foreign_key: true

      t.timestamps
    end
  end
end
