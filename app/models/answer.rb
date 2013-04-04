class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  attr_accessible :content, :user_id, :question_id
end
