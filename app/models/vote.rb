class Vote < ActiveRecord::Base
  belongs_to :votable, :polymorphic => true
  belongs_to :voter, class_name: "User", foreign_key: :user_id

  def assign_vote_value(value)
    self.vote_amount = value
  end
end
