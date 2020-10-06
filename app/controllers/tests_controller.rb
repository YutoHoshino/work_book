class TestsController < ApplicationController
  def new
    @questions = Question.all.sample(11)
    @description = [
      @questions[0],
      @questions[1],
      @questions[2]
  ]

  @descriptions = @description.sample(3)

  @question = @description[1]
  end

  def create
    if @answer = (params[:correct_question]).to_i ==  (params[:question]).delete("{:value=>}").to_i
      respond_to do |format|
        format.html { redirect_to new_test_path}
        format.json { render json: @answer}
      end
    else
      respond_to do |format|
        format.html { redirect_to new_test_path }
        format.json { render json: @answer}
      end
    end
  end
end
