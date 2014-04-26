class AddHscMarksToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :hsc_marks, :integer
  end
end
