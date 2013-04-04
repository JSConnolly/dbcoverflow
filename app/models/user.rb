class User < ActiveRecord::Base
  attr_accessible :email, :name, :password
  validates_presence_of :email, :name, :password_digest
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  has_secure_password
  has_many :questions
  has_many :answers


   # db table:
   #    t.string :name
   #    t.string :email
   #    t.string :password_digest
end
