class AddPaperNameToPaper < ActiveRecord::Migration
  def change
    add_column :papers, :paper_name, :string
  end
end
