class AddMerchantIdToCategories < ActiveRecord::Migration
  def change
    add_reference :categories, :merchant, index: true, foreign_key: true
  end
end
