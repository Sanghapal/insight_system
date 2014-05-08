class Subject < ActiveRecord::Base
  attr_accessible :subject
  has_many :marking_pattens
  has_many :grades, :through => :marking_pattens
  has_many :questions, :dependent => :destroy
  has_and_belongs_to_many :exams
end
