class AddTokenToNomads < ActiveRecord::Migration[5.0]
  def change
    add_column :nomads, :authentication_token, :string, limit: 30
    add_index :nomads, :authentication_token, unique: true
  end
end
