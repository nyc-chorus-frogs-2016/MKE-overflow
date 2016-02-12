class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find_by(id: params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash.notice = "Your question was successfully created."
      redirect_to question_path(@question)
    else
      flash[:error] = "Your question was not successfully created. Make sure all fields are filled in."
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @question = Question.find_by(id: params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:content, :title).merge(user_id: current_user.id)
  end
end
