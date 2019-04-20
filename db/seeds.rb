# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

questions = Question.create([{email: "tester1@test.com", body: "Test body 1"}, 
{email: "tester2@test.com", body: "Test body 2"}, {email: "tester3@test.com", body: "Test body 3"}])

answers = Answer.create([{question_id: questions.first, email: "tester2@test.com", body: "Test answer 1"}])
