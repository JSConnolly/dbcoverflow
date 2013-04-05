class Vote < ActiveRecord::Base
  attr_accessible :points, :user_id, :voteable_id, :voteable_type
  validates_presence_of :voteable_type, :voteable_id, :user_id, :points
  validates :voteable_type, :inclusion => { :in => ['comment', 'answer'] }
  validates :points, :inclusion => { :in => [-1, 1] }
  belongs_to :imageable, polymorphic: true
  belongs_to :user


      # t.integer :points
      # t.string :voteable_type
      # t.integer :voteable_id
      # t.integer :user_id

      # t.timestamps
end
