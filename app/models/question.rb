class Question < ActiveRecord::Base
	attr_accessible :title, :content, :user_id
	belongs_to :user
	has_many :answers
	has_many :votes, :as => :votable
	validates_presence_of :title, :content
end