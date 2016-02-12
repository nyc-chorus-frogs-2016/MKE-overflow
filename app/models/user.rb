class User < ActiveRecord::Base
	has_secure_password
	has_many :questions
	has_many :answers
	has_many :votes
	has_many :comments
	validates :username, presence: true, uniqueness: true

  def has_voted_question?(question)
    votes.where(votable_id: question.id, votable_type: 'Question').count > 0
  end

  def has_voted_answer?(answer)
    votes.where(votable_id: answer.id, votable_type: 'Answer').count > 0
  end

  def has_voted?(question)
    Question.votes.where(user: current_user).count > 0
  end
end
