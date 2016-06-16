class AddMerchantIdToLocations < ActiveRecord::Migration
  def change
    add_reference :locations, :merchant, index: true, foreign_key: true
  end
end
