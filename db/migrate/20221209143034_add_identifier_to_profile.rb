class AddIdentifierToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :identifier, :string
  end
end
