class AnswersController < ApplicationController
  def create
    @question = Question.find_by(id: params[:question_id])
    create_answer(@question)
  end

  def new

  end

  def edit
    @answer = Answer.find_by(id: params[:id])
  end

  def update
    @answer = Answer.find_by(id: params[:id])
    if @answer.update(answer_params)
      flash[:notice] = 'Update to your answer was saved'
      redirect_to question_path(@answer.question)
    else
      flash[:error] = 'Please try again'
      render :edit
    end
  end

  def destroy
    answer = Answer.find_by(id: params[:id])
    answer.destroy
    redirect_to question_path(answer.question)
  end

  private

  def create_answer(question)
    @answer = @question.answers.create(answer_params)
    if @answer.save
      flash[:notice] = 'Thank you for submitting an answer!'
    else
      flash[:alert] ='Sorry, your comment failed to save, please try again'
    end
    redirect_to question_path(@question)
  end

  def answer_params
    params.require(:answer).permit(:content).merge(user: current_user)
  end
end
