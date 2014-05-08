class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :attempt
      t.integer :get_marks
      t.integer :total_marks

      t.timestamps
    end
    add_index :results, :attempt_id
  end
end
