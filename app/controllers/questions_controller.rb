class QuestionsController < ApplicationController
  before_action :set_question, only:[:edit, :update, :destroy, :show]

  def index
    @questions = Question.all.includes(:question_similars)
  end

  def new
    @question = Question.new
    @question.question_similars.new
  end

  def create
    @question = Question.new(params_question)
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    
    @question.attributes = params_question_update

    puts 'ここに表示'
    puts @question.question

    if @question.valid?
      @question.update(params_question_update)
      redirect_to questions_path
    else
      flash.now[:alert] = '入力欄が空です'
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  def search
    @questions = Question.search(params[:search])
  end


  private

  def params_question
    params.require(:question).permit(:question, :description, question_similars_attributes: [:similar_word])
  end

  def params_question_update
    params.require(:question).permit(:question, :description, question_similars_attributes: [:similar_word, :_destroy, :id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

end
