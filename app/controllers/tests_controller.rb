class TestsController < ApplicationController
  def new
    # 問題の変数
    session[:array] = []
    @questions = Question.all.sample(100)
    @description = [@questions[0],@questions[1],@questions[2]]
    @question = @description[1]
    
    if @questions.count < 3 
      flash.now[:alert] = '単語を３つ以上登録してください'
      render template: "homes/index"
    end
    
    # sessionの初期変数
    session[:correct_answer] = 0
    session[:incorrect_answer] = 0
    session[:answer_check] = ''
    session[:answer_num] = 1
    
  end

  def create
    # 問題のIDと解答のID(params)
    params_correct = (params[:correct_question]).delete("{:value=>}").to_i
    params_question = (params[:question]).delete("{:value=>}").to_i

    # session配列にIDの番号を入れる
    session[:array] << params_correct

    # 一度出たIDを出なくする
    @questions = Question.where.not(id: session[:array])
    puts @questions.count
    
    
    if @questions.count > 0
      # 一度出たID以外のIDを１つ取得 ( 問題 )
      @question = @questions.sample()

      # 上のID以外の２つを取得
      description = Question.where.not(id: @question.id)
      descriptions = description.sample(2)
      
      # ３択のIDを取得 ( 解答 )
      @description = descriptions << @question
    end


    # 問題ページを遷移することに+1
    session[:answer_num] +=1


    if session[:answer_num] < 6

      # 答え合わせの条件分岐
      if params_question == params_correct
        session[:answer_check] = '正解'
        session[:correct_answer] +=1
      else
        session[:answer_check] = '不正解'
        session[:incorrect_answer] +=1
      end

    else
      # 答え合わせの条件分岐
      if params_question == params_correct
        session[:answer_check] = '正解'
        session[:correct_answer] +=1
      else
        session[:answer_check] = '不正解'
        session[:incorrect_answer] +=1
      end

      # 正答率
      session[:answer_rate] = session[:correct_answer] * 100 / 5
      rate = session[:answer_rate]
      highest = current_user.highest_rate
      
      # ハイスコア更新
      if highest.nil? or highest < rate  
        current_user.update_attribute(:highest_rate, rate)
      end

      redirect_to rank_tests_path
    end

  end

  def update
  end

  def rank
    @rank = User.order(highest_rate: "DESC")
  end

end
