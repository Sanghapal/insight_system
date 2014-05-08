class RemoveSubjectIdFromExam < ActiveRecord::Migration
  def up
    remove_column :exams, :subject_id
  end

  def down
    add_column :exams, :subject_id, :integer
  end
end
