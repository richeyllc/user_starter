class CreateUsertypes < ActiveRecord::Migration
  def change
    create_table :usertypes do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
