class AddOrderLeadTimeToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :order_lead_time, :string
  end
end
