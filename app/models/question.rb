class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def self.most_recent
    Question.order(created_at: :desc)
  end

  def self.most_votes
    Question.joins(:votes).group(:id).order('sum (votes.vote_amount) desc')
  end

  def self.trending
    # how are we defining trending. most recent comment? answer?
  end

  def total_votes
    votes.sum(:vote_amount)
  end

  def sort_answers
    sort_array=answers.sort_by do |answer|
      answer.total_votes
    end
    sort_array.reverse!
  end

    def select_best?
      best = []
    self.answers.map do |answer|
      best << answer if answer.best_answer == "true"
    end
    return true if best == []
  end


  def locked?
    if self.status == "lock"
      return true
    else
      false
    end
  end
end
