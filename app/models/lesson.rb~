class Lesson < ActiveRecord::Base
  belongs_to :grade
  has_many :topics, :dependent => :destroy
  attr_accessible :lesson_name, :grade_id
  validates :lesson_name, :presence => true
end
