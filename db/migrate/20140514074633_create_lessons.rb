class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :lesson_name
      t.references :grade

      t.timestamps
    end
    add_index :lessons, :grade_id
  end
end
