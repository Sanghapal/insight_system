class AddAttemptFlagToPaper < ActiveRecord::Migration
  def change
    add_column :papers, :attempt_flag, :boolean
  end
end
