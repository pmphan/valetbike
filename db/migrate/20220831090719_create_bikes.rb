class CreateBikes < ActiveRecord::Migration[7.0]
  def change
    create_table :bikes do |t|
      t.string :identifier
      t.string :current_station_id

      t.timestamps
    end
  end
end
