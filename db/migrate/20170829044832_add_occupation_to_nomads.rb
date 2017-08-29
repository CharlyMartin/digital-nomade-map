class AddOccupationToNomads < ActiveRecord::Migration[5.0]
  def change
    add_column :nomads, :occupation, :string, default: 'I love using nomadmap!'
    add_column :nomads, :gender, :integer, default: 0
  end
end
