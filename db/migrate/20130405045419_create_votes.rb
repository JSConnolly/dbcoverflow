class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :points
      t.string :voteable_type
      t.integer :voteable_id
      t.integer :user_id

      t.timestamps
    end
  end
end
