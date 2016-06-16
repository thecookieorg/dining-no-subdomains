class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.text :about
      t.string :phone
      t.string :email
      t.boolean :takeout
      t.boolean :delivery
      t.string :address

      t.timestamps null: false
    end
  end
end
