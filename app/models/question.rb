class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def self.most_recent
    Question.order(created_at: :desc)
  end

  def self.most_votes
    # something like Question.joins(:votes).group("voteable.id").order("count("questions.id) DESC")
  end

  def self.trending
    # how are we defining questions
  end

  def total_votes
    @vote_total = 0
    self.votes.each do |vote|
      @vote_total = vote.vote_amount + @vote_total
    end
    @vote_total
  end

end
