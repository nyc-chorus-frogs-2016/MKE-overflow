class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :commenter, class_name: "User", foreign_key: :user_id

  def total_votes
    @vote_total = 0
    self.votes.each do |vote|
      @vote_total = vote.vote_amount + @vote_total
    end
    @vote_total
  end
end
