# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do
  User.create!(username: Faker::Internet.user_name, password: "123")
end

15.times do
	Question.create!(title: Faker::Name.title, content: Faker::Hipster.paragraph, user_id: User.all.sample.id)
end

15.times do
	Answer.create!(content: Faker::Hipster.paragraph, question_id: Question.all.sample.id, user_id: User.all.sample.id)
end
