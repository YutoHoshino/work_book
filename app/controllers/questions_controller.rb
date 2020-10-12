class QuestionsController < ApplicationController
  before_action :set_question, only:[:edit, :update, :destroy, :show]

  def index
    @questions = Question.all.includes(:question_similars)
  end

  def new
    @question = Question.new
    @question.question_similars.build
  end

  def create
    @question = Question.new(params_question)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: '単語を登録しました' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update

    respond_to do |format|
      if @question.update(params_question)
        format.html { redirect_to @question, notice: '更新しました' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
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
    params.require(:question).permit(:question, :description, question_similars_attributes: [:id, :similar_word, :_destroy])
  end

  def set_question
    @question = Question.find(params[:id])
  end

end
