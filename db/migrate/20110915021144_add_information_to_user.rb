class AddInformationToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :avatar, :string
  end
end
