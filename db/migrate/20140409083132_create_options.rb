class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :option_name
      t.boolean :option_right
      t.references :question

      t.timestamps
    end
    add_index :options, :question_id
  end
end
