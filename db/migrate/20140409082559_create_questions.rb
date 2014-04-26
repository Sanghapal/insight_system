class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question_name
      t.string :question_discription
      t.references :subject

      t.timestamps
    end
    add_index :questions, :subject_id
  end
end
