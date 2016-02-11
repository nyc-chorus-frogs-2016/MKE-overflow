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
end
