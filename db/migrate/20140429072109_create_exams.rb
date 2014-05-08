class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.date :exam_date
      t.string :discription
      t.references :grade

      t.timestamps
    end
    add_index :exams, :grade_id
  end
end
