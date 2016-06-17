class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :portion_size
      t.decimal :size_based_price, precision: 8, scale: 2
      t.string :size_description

      t.timestamps null: false
    end
  end
end
