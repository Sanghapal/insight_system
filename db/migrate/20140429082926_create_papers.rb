class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.time :exam_time
      t.references :exam

      t.timestamps
    end
    add_index :papers, :exam_id
  end
end
