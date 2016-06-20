class AddPrinterPhoneNumberToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :printer_phone_number, :string
  end
end
