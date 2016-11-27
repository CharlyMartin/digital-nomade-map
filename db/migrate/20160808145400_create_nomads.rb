class CreateNomads < ActiveRecord::Migration[5.0]
  def change
    create_table :nomads do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :facebook
      t.string :email
      t.string :address
      t.string :zip_code
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
