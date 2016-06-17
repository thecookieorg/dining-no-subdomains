class AddMerchantIdToProductTaxes < ActiveRecord::Migration
  def change
    add_reference :product_taxes, :merchant, index: true, foreign_key: true
  end
end
