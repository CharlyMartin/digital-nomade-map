class AddUsernameToNomads < ActiveRecord::Migration[5.0]
  def change
    add_column :nomads, :username, :string
  end
end
