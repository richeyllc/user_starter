class CreateUserPreferences < ActiveRecord::Migration
  def change
    create_table :user_preferences do |t|
      t.string :username
      t.string :firstname
      t.string :lastname
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
