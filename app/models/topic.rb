class Topic < ActiveRecord::Base
  belongs_to :lesson
  attr_accessible :topic_discription, :topic_name, :lesson_id
  validates :topic_discription, :topic_name, :presence => true
end
