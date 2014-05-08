class Option < ActiveRecord::Base
  belongs_to :question
  belongs_to :attempt
  attr_accessible :option_name, :option_right, :question_id, :attempt_id
  validates :option_name, :presence => true
#  validate :validate_options

#  def validate_options
#    self.errors.add(:base,  "Atleast one option should be valid") if {:option_right => 'true'}.count = 0
#    self.errors.add(:base, "Multiple options can't be valid") if question.options.collect(&:option_right).count(true) > 1 
#  end

end
