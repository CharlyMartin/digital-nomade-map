class AddCoordinatesToNomads < ActiveRecord::Migration[5.0]
  def change
    add_column :nomads, :latitude, :float
    add_column :nomads, :longitude, :float
  end
end
