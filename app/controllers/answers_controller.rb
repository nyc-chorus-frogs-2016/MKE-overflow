class AnswersController < ApplicationController
  def create
    @question = Question.find_by(id: params[:question_id])
    create_answer(@question)
  end

  def new

  end

  def edit

  end

  def update

  end

  def destroy

  end
  private

  def create_answer(question)
    @answer = @question.answers.create(answer_params)
    if @answer.save
      flash[:notice] = 'Thank you for submitting an answer!'
    else
      flash[:alert] ='Sorry, your comment fialed to save, please try again'
    end
    redirect_to question_path(@question)
  end

  def answer_params
    params.require(:answer).permit(:content).merge(user: current_user)
  end
end
