class AddNicknameToBike < ActiveRecord::Migration[7.0]
  def change
    add_column :bikes, :nickname, :string, default: "Polar"
  end
end
