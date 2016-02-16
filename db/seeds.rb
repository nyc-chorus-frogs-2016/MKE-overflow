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

50.times do
	Answer.create!(content: Faker::Hipster.paragraph, question_id: Question.all.sample.id, user_id: User.all.sample.id, best_answer: false)
end

25.times do
  Comment.create!(content: Faker::Hipster.paragraph, commentable_id: Question.all.sample.id,  user_id: User.all.sample.id, commentable_type: "Question" )
end
25.times do
  Comment.create!(content: Faker::Hipster.paragraph, commentable_id: Answer.all.sample.id,  user_id: User.all.sample.id, commentable_type: "Answer" )
end
25.times do
  Vote.create!(votable_id: Question.all.sample.id,  user_id: User.all.sample.id, votable_type: "Question", vote_amount: 1 )
end
25.times do
  Vote.create!(votable_id: Question.all.sample.id,  user_id: User.all.sample.id, votable_type: "Question", vote_amount: -1 )
end

25.times do
  Vote.create!(votable_id: Question.all.sample.id,  user_id: User.all.sample.id, votable_type: "Answer", vote_amount: 1 )
end
25.times do
  Vote.create!(votable_id: Question.all.sample.id,  user_id: User.all.sample.id, votable_type: "Answer", vote_amount: -1 )
end

5.times do
  Question.first.tags << Tag.create!(name: Faker::Name.title)

end

5.times do
  Question.last.tags << Tag.create!(name: Faker::Name.title)
end


  Question.last.tags << Tag.find_or_create_by(name: "hello")
10.times do
 Question.all.sample.tags << Tag.find_or_create_by(name: "hello")
end

10.times do
 Question.all.sample.tags << Tag.find_or_create_by(name: "DBC")
end

