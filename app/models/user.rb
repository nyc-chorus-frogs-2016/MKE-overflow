class User < ActiveRecord::Base
	has_secure_password
	has_many :questions
	has_many :answers
	has_many :votes
	has_many :comments
	validates :username, presence: true, uniqueness: true

  def has_voted?
    self.votes.any?
  end
end
