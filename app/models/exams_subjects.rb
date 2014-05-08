class ExamsSubjects < ActiveRecord::Base
  belongs_to :exam
  belongs_to :subject
   attr_accessible :subject_id, :exam_id
  validates :subject_id, :presence => true
end
