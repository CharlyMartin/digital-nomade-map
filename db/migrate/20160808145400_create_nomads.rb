class CreateNomads < ActiveRecord::Migration[5.0]
  def change
    create_table :nomads do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact
      t.string :address
      t.string :zip_code
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
