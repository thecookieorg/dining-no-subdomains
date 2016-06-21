class CreateLocationHours < ActiveRecord::Migration
  def change
    create_table :location_hours do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
