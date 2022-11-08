class AddCoordsToStations < ActiveRecord::Migration[7.0]
  def change
    change_table :stations do |t|
      t.float :latitude, precision: 10, scale: 6, null: false, default: 0
      t.float :longitude, precision: 10, scale: 6, null: false, default: 0
      t.integer :capacity, limit: 1, null: false, default: 0
    end

    add_index :stations, :identifier, unique: true

  end
end
