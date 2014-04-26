class AddComputerMarksToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :computer_marks, :integer
  end
end
