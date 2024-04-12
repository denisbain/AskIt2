class AnswersController < ApplicationController
  before_action :set_question_and_answer

  def update
    if @answer.update answer_params
      flash[:success] = 'Answer updated!'
      redirect_to question_path(@question)
    else
      render 'answers/edit'
    end
  end
  def show
  end
  def edit
  end

  def destroy
    @answer.destroy
    flash[:success] = 'Answer deleted!'
    redirect_to question_path(@question)
  end
  def create
    if @answer.save
      flash[:success] = 'Answer created!'
      redirect_to question_path(@question)
    else
      @answers = @question.answers.order created_at: :desc
      render 'questions/show'
    end
  end


  private
  def answer_params
    params.require(:answer).permit(:body)
  end
  def set_question_and_answer
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end
end