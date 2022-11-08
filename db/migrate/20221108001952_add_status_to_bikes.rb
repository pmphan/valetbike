class AddStatusToBikes < ActiveRecord::Migration[7.0]
  def change
    change_table :bikes do |t|
      t.integer :status, limit: 1, null: false, default: 0
      t.string :current_user_id
    end

    add_index :bikes, :identifier, unique: true

  end
end
