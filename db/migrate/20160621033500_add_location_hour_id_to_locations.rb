class AddLocationHourIdToLocations < ActiveRecord::Migration
  def change
    add_reference :locations, :location_hour, index: true, foreign_key: true
  end
end
