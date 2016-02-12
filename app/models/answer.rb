class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable


  def upvote
    @answer = Answer.find(params[:id])
    @answer.votes.create(user_id: current_user.id, votable_id: @answer.id, vote_amount: 1)
    redirect_to answer_path(@answer)
  end

  def downvote
    @answer = Answer.find(params[:id])
    @answer.votes.create(user_id: current_user.id, votable_id: @answer.id, vote_amount: -1)
    redirect_to answer_path(@answer)
  end

    def total_votes
    @vote_total = 0
    self.votes.each do |vote|
      @vote_total = vote.vote_amount + @vote_total
    end
    @vote_total
  end
end
