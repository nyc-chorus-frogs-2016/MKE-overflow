require 'rails_helper'

RSpec.describe Comment, type: :model do

   before(:each) do
     @user  = User.create!( :username => "Eddie", :password => "111" )
     @question = Question.create!( title: "New test", content: "this is annoying", user_id: @user.id)
    @answer = Answer.create!( content: "this is sooo annoying", user_id: @user.id, question_id: @question.id)
    @comment = Comment.create!(content: "Im so bored!!!", user_id: @user.id, commentable_type: "Question", commentable_id: @question.id)
  end

  it " should belong to a question or answer" do
   expect(@question.comments.first).to eq @comment
  end

  it "should have a commenter" do
    expect(@comment.commenter).to eq @user
  end

    it "should have a content" do
    expect(@comment.content).to eq "Im so bored!!!"
  end


end
