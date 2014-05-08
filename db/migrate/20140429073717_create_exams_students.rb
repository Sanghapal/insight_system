class CreateExamsStudents < ActiveRecord::Migration
  def change
    create_table :exams_students do |t|
      t.references :exam
      t.references :student

      t.timestamps
    end
    add_index :exams_students, :exam_id
    add_index :exams_students, :student_id
  end
end
