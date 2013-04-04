class Vote
	attr_accessible :votable_type, :votable_id, :user_id
	belongs_to :votable, :polymorphic => true
end