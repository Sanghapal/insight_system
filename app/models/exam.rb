class Exam < ActiveRecord::Base
  belongs_to :grade
  has_many :papers
  has_and_belongs_to_many :students
  has_and_belongs_to_many :subjects
  attr_accessible :discription, :exam_name, :exam_date, :grade_id
  validates :discription, :exam_date, :exam_name, :presence => true
end
