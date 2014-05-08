class AddCurrentPaperFlagToPaper < ActiveRecord::Migration
  def change
    add_column :papers, :current_paper_flag, :boolean
  end
end
