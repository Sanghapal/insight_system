class AddPaperIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :paper_id, :integer

  end
end
