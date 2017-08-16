class CreateAlerts < ActiveRecord::Migration[5.0]
  def change
    create_table :alerts do |t|
      t.boolean :active
      t.string :phone
      t.string :alert_level
      t.string :zipcode

      t.timestamps null: false
    end
  end
end
