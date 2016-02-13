require 'rails_helper'

RSpec.describe Vote, type: :model do
  before(:each) do
    @user  = User.create!( :username => "Eddie", :password => "111" )
    @question = Question.create!( title: "New test", content: "this is annoying", user_id: @user.id)
    @answer = Answer.create!( content: "this is sooo annoying", user_id: @user.id, question_id: @question.id)
    @qvote = Vote.create!(user_id: @user.id, vote_amount: 1, votable_id: @question.id, votable_type: "Question")
    @avote = Vote.create!(user_id: @user.id, vote_amount: 1, votable_id: @answer.id, votable_type: "Answer")
  end
  it "should have a question" do
    expect(@qvote.votable_id).to eq @question.id
  end

  it "should have a answer" do
    expect(@avote.votable_id).to eq @answer.id
  end

  it "should have a user" do
    expect(@avote.user_id).to eq @user.id
  end
end
