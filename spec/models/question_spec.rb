require 'rails_helper'

RSpec.describe Question, type: :model do

 before(:each) do
     @user  = User.create!( :username => "Eddie", :password => "111" )
     @question = Question.create!( title: "New test", content: "this is annoying", user_id: @user.id)
    @answer = Answer.create!( content: "this is sooo annoying", user_id: @user.id, question_id: @question.id)
  end

  it " should be be open by default" do
   expect(@question.status).to eq "open"
  end

  it "should have a user" do
    expect(@question.user).to eq @user
  end

  it "should have a title" do
    expect(@question.title).to eq "New test"
  end

end
