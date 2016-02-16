require 'rails_helper'

RSpec.describe Answer, type: :model do

   before(:each) do
     @user  = User.create!( :username => "Eddie", :password => "111" )
     @question = Question.create!( title: "New test", content: "this is annoying", user_id: @user.id)
    @answer = Answer.create!( content: "this is sooo annoying", user_id: @user.id, question_id: @question.id)
  end

  it " should be have empty best_answer attr by default" do
   expect(@answer.best_answer).to eq nil
  end

  it "should have a question" do
    expect(@answer.question).to eq @question
  end

  it "should have a user" do
    expect(@answer.user).to eq @user
  end

    it "should have a content" do
    expect(@answer.content).to eq "this is sooo annoying"
  end


end
