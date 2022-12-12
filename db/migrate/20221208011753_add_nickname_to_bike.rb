class AddNicknameToBike < ActiveRecord::Migration[7.0]
  def change
    add_column :bikes, :nickname, :string, default: "Polar"
    add_index(:bikes, :current_user_id, unique: true)
  end
end
