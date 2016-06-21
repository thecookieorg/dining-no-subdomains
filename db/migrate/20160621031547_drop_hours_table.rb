class DropHoursTable < ActiveRecord::Migration
  def change
  	drop_table :hours
  end
end
