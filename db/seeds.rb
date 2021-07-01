# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
    user = User.create(name: Faker::Name.first_name , email: Faker::Internet.email)
    question = Question.create(label: Faker::Lorem.word, active: Faker::Boolean.boolean)
end

10.times do 
    user.persisted? && question.persisted?
        Answer.create(
            answer: Faker::Lorem.word,
            question_id: rand(1..10),
            user_id: rand(1..10)
        )
end
