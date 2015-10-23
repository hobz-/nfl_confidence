class AddResultToPick < ActiveRecord::Migration
  def change
    add_column :picks, :result, :integer
  end
end
