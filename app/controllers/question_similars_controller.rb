class QuestionSimilarsController < ApplicationController

  def new
    @similar = QuestionSimilar.new
  end

  def create
    @similar = QuestionSimilar.new(params_question_similar)

    if @similar.save
      redirect_to edit_question_path(@similar.question)
    else
      render :new
    end
  end

  def destroy
    question = QuestionSimilar.find(params[:id])
    question.destroy
    redirect_to root_path
  end


  private

  def params_question_similar
    params.require(:question_similar).permit(:similar_word).merge(question_id: params[:question_id])
  end
end
