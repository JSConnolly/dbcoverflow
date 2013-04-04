FactoryGirl.define do
	factory :user do
		name Faker::Name.name
		email Faker::Internet.email
		password Faker::Lorem.word
	end

  factory :question do
    title Faker::Lorem.sentence(6)
    content Faker::Lorem.paragraph
    user_id 1
  end
end