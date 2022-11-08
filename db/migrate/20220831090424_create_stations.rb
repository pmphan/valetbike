class CreateStations < ActiveRecord::Migration[7.0]
  def change
    create_table :stations do |t|
      t.string :identifier
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
