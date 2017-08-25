class AddAirIndexKeyToAlertsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :alerts, :air_index_id, :integer
    remove_column :alerts, :alert_level
  end
end
