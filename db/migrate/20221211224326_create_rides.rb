class CreateRides < ActiveRecord::Migration[7.0]
  def change
    create_table :rides do |t|
      t.string :identifier, null: false, index: true, unique: true
      t.string :user_id, null: false, index: true
      t.string :bike_id, null: false, index: true
      t.string :from_station, null: false
      t.string :to_station
      t.datetime :start_time, null: false
      t.datetime :end_time
      t.integer :status, limit: 1, null: false, default: 0
      t.timestamps
    end
  end
end
