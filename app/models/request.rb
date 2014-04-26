class Request < ActiveRecord::Base
  attr_accessible :email, :name, :answer, :computer_knowledge, :computer_marks, :ssc_marks, :hsc_marks, :graduation_status, :graduation_marks
  validates :name, :email, :answer, :computer_knowledge, :computer_marks, :ssc_marks, :hsc_marks, :graduation_status, :presence => true
 validates :email, :format => { :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i , :message => "Not a valid email address"}
  validate :checkanswer
  def checkanswer
    if answer
      errors.add(:answer, " Answer is wrong please try again ") if answer != 8118
    end
  end
end
