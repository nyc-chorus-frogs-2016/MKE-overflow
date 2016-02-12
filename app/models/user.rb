class User < ActiveRecord::Base
	has_secure_password
	has_many :questions
	has_many :answers
	has_many :votes
	has_many :comments
	validates :username, presence: true, uniqueness: true

  def has_voted?(question)
    @response = :true
    self.votes.each do |vote|
      if question.votes.include?(vote)
        @response = true
      else
        @response = false
      end
    end
    @response
  end
end
