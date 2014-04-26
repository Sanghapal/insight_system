class AddGraduationMarksToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :graduation_marks, :integer
  end
end
