class CreateQuestions < ActiveRecord::Migration
 def change
 	create_table :questions do |c|
 		c.string  :title
 		c.string  :content
 		c.integer :user_id

 		c.timestamps
 	end
 end
end
