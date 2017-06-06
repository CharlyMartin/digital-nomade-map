class AddFacebookAttributesToNomads < ActiveRecord::Migration[5.0]
  def change
    add_column :nomads, :facebook_picture_url, :string
    add_column :nomads, :token, :string
    add_column :nomads, :token_expiry, :datetime
  end
end
