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
    if (params[:correct_question]).to_i ==  (params[:question]).delete("{:value=>}").to_i
      redirect_to root_path
    else
      redirect_to new_test_path
    end
  end


end
