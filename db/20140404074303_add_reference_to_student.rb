class AddReferenceToStudent < ActiveRecord::Migration
  def change
    add_column :students, :user_id, :string
    add_column :students, :, :integer
  end
end
