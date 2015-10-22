class RemoveNameAndNicknameAndEmailFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :name, :string
    remove_column :users, :nickname, :string
    remove_column :users, :email, :string
  end
end
