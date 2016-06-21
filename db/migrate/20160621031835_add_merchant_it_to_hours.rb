class AddMerchantItToHours < ActiveRecord::Migration
  def change
    add_reference :hours, :merchant, index: true, foreign_key: true
  end
end
