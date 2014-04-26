class AddReferenceToStudent < ActiveRecord::Migration
  def change
    add_column :students, :, :user
  end
end
