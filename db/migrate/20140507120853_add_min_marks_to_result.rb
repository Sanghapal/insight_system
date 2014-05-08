class AddMinMarksToResult < ActiveRecord::Migration
  def change
    add_column :results, :min_marks, :integer
  end
end
