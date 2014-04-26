class BatchesTrainers < ActiveRecord::Base
  belongs_to :batch
  belongs_to :trainer
  belongs_to :marking_patten
  # attr_accessible :title, :body
end
