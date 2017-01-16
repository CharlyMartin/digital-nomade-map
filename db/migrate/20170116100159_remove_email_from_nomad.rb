class RemoveEmailFromNomad < ActiveRecord::Migration[5.0]
  def change
    remove_column :nomads, :email
  end
end
