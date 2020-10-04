class QuestionsController < ApplicationController
  before_action :set_question, only:[:edit, :update]

  def index
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

  def edit_select
    @questions = Question.all
  end

  def edit
  end

  def update
    @question.update(params_question)
    redirect_to root_path

  end

  def destroy
  end


  private

  def params_question
    params.require(:question).permit(:question, :description)
  end

  def set_question
    @question = Question.find(params[:id])
  end

end
