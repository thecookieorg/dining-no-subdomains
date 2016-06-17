class AddProdutTaxIdToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :product_tax, index: true, foreign_key: true
  end
end
