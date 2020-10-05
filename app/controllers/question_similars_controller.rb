class QuestionSimilarsController < ApplicationController
  def new
    @similar = QuestionSimilar.new
  end

  def create
    @similar = QuestionSimilar.new(params_question_similar)

    if @similar.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def params_question_similar
    params.require(:question_similar).permit(:similar_word).merge(question_id: params[:question_id])
  end

end
