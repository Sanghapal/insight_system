class AddResultStatusToResult < ActiveRecord::Migration
  def change
    add_column :results, :result_status, :string
  end
end
