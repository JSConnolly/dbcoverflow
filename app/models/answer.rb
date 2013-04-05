class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :imageable
  attr_accessible :content, :user_id, :question_id
  validates_presence_of :user_id, :content

  # t.string :content
  # t.references :user
  # t.references :question
  # 
  # add_index :answers, :user_id
  # add_index :answers, :question_id
  # t.timestamps


end
