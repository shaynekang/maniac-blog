class AddInformationToUser < ActiveRecord::Migration
  class AddUserIdToPost < ActiveRecord::Migration
    def self.up
      add_column :posts, :user_id, :integer
    end

    def self.down
      remove_column :posts, :user
    end
  end
  
  
  def change
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :avatar, :string
  end
end
