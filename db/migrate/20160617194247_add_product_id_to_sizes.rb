class AddProductIdToSizes < ActiveRecord::Migration
  def change
    add_reference :sizes, :product, index: true, foreign_key: true
  end
end
