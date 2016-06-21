class AddMerchantIdToLocationHours < ActiveRecord::Migration
  def change
    add_reference :location_hours, :merchant, index: true, foreign_key: true
  end
end
