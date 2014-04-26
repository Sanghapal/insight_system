class AddAnswerToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :answer, :integer
  end
end
