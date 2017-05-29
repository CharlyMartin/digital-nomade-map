class AddOmniauthToNomads < ActiveRecord::Migration[5.0]
  def change
    add_column :nomads, :provider, :string
    add_column :nomads, :uid, :string
  end
end
