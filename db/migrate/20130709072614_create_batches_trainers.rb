class CreateBatchesTrainers < ActiveRecord::Migration
  def change
    create_table :batches_trainers do |t|
      t.references :batch
      t.references :trainer
      t.references :marking_patten

      t.timestamps
    end
    add_index :batches_trainers, :batch_id
    add_index :batches_trainers, :trainer_id
    add_index :batches_trainers, :marking_patten_id
  end
end
