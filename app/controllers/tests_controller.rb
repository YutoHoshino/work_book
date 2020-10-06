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
    @questions = Question.all.sample(11)
    @description = [
      @questions[0],
      @questions[1],
      @questions[2]
  ]

  @descriptions = @description.sample(3)

  @question = @description[1]
    @answer = (params[:correct_question]).to_i ==  (params[:question]).delete("{:value=>}").to_i


  end
end
