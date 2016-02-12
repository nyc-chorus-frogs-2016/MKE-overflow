class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :commenter, class_name: "User", foreign_key: :user_id

end

  def two_url(context)
     if Question === context
      question_comments_path(context)
    else
       question_answer_comments_path(context.question, context)
    end
  end

  def edit_two_url(context, comment)
     if Question === context
      question_comment_path(context)
    else
       question_answer_comment_path(context.question, context, comment)
    end
  end


