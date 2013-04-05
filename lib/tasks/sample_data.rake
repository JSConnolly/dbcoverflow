require 'Faker'
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "J",
                 email: "j@lifthero.com",
                 password: "password")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@lifthero.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password)
    end
  end
end