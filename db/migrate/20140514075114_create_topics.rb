class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :topic_name
      t.string :topic_discription
      t.references :lesson

      t.timestamps
    end
    add_index :topics, :lesson_id
  end
end
