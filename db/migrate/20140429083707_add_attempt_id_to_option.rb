class AddAttemptIdToOption < ActiveRecord::Migration
  def change
    add_column :options, :attempt_id, :integer

  end
end
