class AddMerchantIdToSizes < ActiveRecord::Migration
  def change
    add_reference :sizes, :merchant, index: true, foreign_key: true
  end
end
