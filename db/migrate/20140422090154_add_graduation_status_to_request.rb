class AddGraduationStatusToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :graduation_status, :string
  end
end
