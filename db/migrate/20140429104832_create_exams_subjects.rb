class CreateExamsSubjects < ActiveRecord::Migration
  def change
    create_table :exams_subjects do |t|
      t.references :exam
      t.references :subject

      t.timestamps
    end
    add_index :exams_subjects, :exam_id
    add_index :exams_subjects, :subject_id
  end
end
