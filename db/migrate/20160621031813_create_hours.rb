class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.integer :day
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :closed

      t.timestamps null: false
    end
  end
end
