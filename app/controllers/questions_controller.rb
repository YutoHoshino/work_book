class QuestionsController < ApplicationController
  before_action :set_question, only:[:edit, :update, :destroy, :show]

  def index
    @questions = Question.all.includes(:question_similars)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params_question)
    if @question.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @question.update(params_question)
    redirect_to root_path
  end

  def destroy
    @question.destroy
    redirect_to root_path
  end

  def search
    @questions = Question.search(params[:search])
  end


  private

  def params_question
    params.require(:question).permit(:question, :description)
  end

  def set_question
    @question = Question.find(params[:id])
  end

end
