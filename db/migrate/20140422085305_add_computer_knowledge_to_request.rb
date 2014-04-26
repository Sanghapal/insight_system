class AddComputerKnowledgeToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :computer_knowledge, :string
  end
end
