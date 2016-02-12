class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

    def total_votes
    @vote_total = 0
    self.votes.each do |vote|
      @vote_total = vote.vote_amount + @vote_total
    end
    @vote_total
  end
end
