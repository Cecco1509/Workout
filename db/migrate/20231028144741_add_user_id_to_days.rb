class AddUserIdToDays < ActiveRecord::Migration[7.0]
  def change
    add_column :days, :user_id, :integer
    add_index :days, :user_id
  end
end
