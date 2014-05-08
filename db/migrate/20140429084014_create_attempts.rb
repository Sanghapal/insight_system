class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.integer :total_marks
      t.references :paper
      t.references :student

      t.timestamps
    end
    add_index :attempts, :paper_id
    add_index :attempts, :student_id
  end
end
