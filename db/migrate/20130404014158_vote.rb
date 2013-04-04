class Vote < ActiveRecord::Migration
  def change
  	create_table :votes do |c|
  		c.integer :user_id
  		c.integer :votable_id
  		c.string :votable_type
  		
  	end
  end
end
