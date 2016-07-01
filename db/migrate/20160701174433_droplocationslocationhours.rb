class Droplocationslocationhours < ActiveRecord::Migration
  def change
  	drop_table :locationslocationhours
    create_table :locationslocationhours, :id => false do |t|
      t.integer :location_id, null: false
      t.integer :location_hour_id, null: false
    end
  end
end
