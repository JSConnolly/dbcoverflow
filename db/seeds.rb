# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create name: "Matthew", email: "Matthew@gmail.com", password: "Password"
Question.create title: "question?", content: "q?", user_id: 1
Answer.create content: "Answer", question_id: 1, user_id: 1 