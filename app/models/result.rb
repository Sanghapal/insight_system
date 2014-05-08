class Result < ActiveRecord::Base
  belongs_to :attempt
  attr_accessible :get_marks, :total_marks, :result_status, :min_marks, :attempt_id
end
