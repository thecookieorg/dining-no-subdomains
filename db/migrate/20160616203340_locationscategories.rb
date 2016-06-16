class Locationscategories < ActiveRecord::Migration
  def change
  	create_table :locationscategories, :id => false do |t|
      t.integer :location_id, null: false
      t.integer :category_id, null: false
    end
  end
end
