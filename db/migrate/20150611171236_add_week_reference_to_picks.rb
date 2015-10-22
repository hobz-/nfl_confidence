class AddWeekReferenceToPicks < ActiveRecord::Migration
  def change
    add_reference :picks, :week, index: true
    add_foreign_key :picks, :weeks
  end
end
