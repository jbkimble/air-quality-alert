class CreateAirIndex < ActiveRecord::Migration[5.0]
  def change
    create_table :air_indices do |t|
      t.string :index

      t.timestamps null: false
    end
  end
end
