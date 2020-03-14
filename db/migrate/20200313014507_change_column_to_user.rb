class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :nickname, :string, null: false
  end
end
