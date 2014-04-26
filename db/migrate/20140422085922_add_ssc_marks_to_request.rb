class AddSscMarksToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :ssc_marks, :string
  end
end
