class Question < ActiveRecord::Base
	attr_accessible :title, :content, :user_id
	belongs_to :user
	has_many :answers
  has_many :votes, as: :imageable
	validates_presence_of :title, :content

    # c.string  :title
    # c.string  :content
    # c.integer :user_id

    # c.timestamps
end