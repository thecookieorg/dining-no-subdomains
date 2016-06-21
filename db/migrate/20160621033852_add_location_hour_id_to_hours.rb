class AddLocationHourIdToHours < ActiveRecord::Migration
  def change
    add_reference :hours, :location_hour, index: true, foreign_key: true
  end
end
