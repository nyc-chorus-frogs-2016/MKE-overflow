class CommentsController < ApplicationController

  def new
    @context = context
    @comment = @context.comments.new
  end

  def create
     @context = context
     @comment = @context.comments.new(comment_params)
     if @comment.save
      redirect_to context_url(context)
    else
      render :'comments/new'
    end
  end


  def edit
    @context = context
    @comment = context.comments.find(params[:id])
  end

  def update
    @context = context
    @comment = @context.comments.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to context_url(context)
    end
  end


def destroy
   @context = context
    @comment = @context.comments.find(params[:id])
    @comment.destroy
    redirect_to context_url(context)
end

  private

  def comment_params
    params.require(:comment).permit!
  end

  def context
    if params[:answer_id]
      id = params[:answer_id]
      Answer.find(params[:answer_id])
    else
      id = params[:question_id]
      Question.find(params[:question_id])
    end
  end



  def context_url(context)
    if Question === context
      question_path(context)
    else
       question_path(context.question)
    end
  end
end
