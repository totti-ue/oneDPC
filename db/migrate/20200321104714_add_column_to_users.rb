class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avator, :text
    add_column :users, :gender, :string
    add_column :users, :age, :string
    add_column :users, :introduction, :text
  end
end
