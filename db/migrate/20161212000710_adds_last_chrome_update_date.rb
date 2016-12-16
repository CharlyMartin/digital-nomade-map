class AddsLastChromeUpdateDate < ActiveRecord::Migration[5.0]
  def change
    add_column :nomads, :last_chrome_update_date, :timestamptz, null: true
  end
end
