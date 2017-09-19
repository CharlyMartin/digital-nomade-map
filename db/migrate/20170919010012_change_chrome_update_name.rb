class ChangeChromeUpdateName < ActiveRecord::Migration[5.0]
  def change
    rename_column :nomads, :last_chrome_update_date, :latest_chrome_update
  end
end
