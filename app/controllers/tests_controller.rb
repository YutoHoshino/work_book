class TestsController < ApplicationController
  def new
    # 問題の変数
    @questions = Question.all.sample(11)
    @description = [@questions[0],@questions[1],@questions[2]]
    @descriptions = @description.sample(3)
    @question = @description[1]

    # sessionの初期変数
    session[:correct_answer] = 0
    session[:incorrect_answer] = 0
    session[:answer_check] = ''
    session[:answer_rate] = 1
  end

  def create
    # 問題の変数
    @questions = Question.all.sample(11)
    @description = [@questions[0],@questions[1],@questions[2]]
    @descriptions = @description.sample(3)
    @question = @description[1]


    # 問題のIDと解答のID(params)
    params_correct = (params[:correct_question]).delete("{:value=>}").to_i
    params_question = (params[:question]).delete("{:value=>}").to_i


    # 問題ページを遷移することに+1
    session[:answer_rate] +=1

    if session[:answer_rate] < 10
      # 答え合わせの条件分岐
      if params_question == params_correct
        session[:answer_check] = '正解'
        session[:correct_answer] +=1
      else
        session[:answer_check] = '不正解'
        session[:incorrect_answer] +=1
      end
    else
      redirect_to root_path
    end

  


  end
end
