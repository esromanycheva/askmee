class ChangeColorToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :color, :string, default: "#370617"
  end
end
