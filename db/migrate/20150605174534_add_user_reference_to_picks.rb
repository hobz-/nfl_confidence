class AddUserReferenceToPicks < ActiveRecord::Migration
  def change
    add_reference :picks, :user, index: true
    add_foreign_key :picks, :users
  end
end