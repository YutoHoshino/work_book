class TestsController < ApplicationController
  def new
    # 問題の変数
    session[:array] = []
    @questions = Question.all.sample(20)
    @description = [@questions[0],@questions[1],@questions[2]]
    @question = @description[1]
    
    if @questions.count < 5
      flash.now[:alert] = '単語を5つ以上登録してください'
      render template: "homes/index"
    end
    
    # sessionの初期変数
    session[:correct_answer] = 0
    session[:incorrect_answer] = 0
    session[:answer_check] = ''
    session[:answer_num] = 1
    
  end

  def create

    puts 'ここに表示されます'
    puts (params[:question]).nil?


    if (params[:question]).nil?
      params_question = 3
    else
      params_question = (params[:question]).delete("{:value=>}").to_i
    end

    # 問題のIDと解答のID(params)
    params_correct = (params[:correct_question]).delete("{:value=>}").to_i

    # session配列にIDの番号を入れる
    session[:array] << params_correct

    # 一度出たIDを出なくする
    @questions = Question.where.not(id: session[:array])
    
    
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



  def rank

    @rank = User.order(highest_rate: "DESC")
    puts @rank.index(current_user)
    only_ranks = @rank.map(&:highest_rate)

    #ハイスコアのみ取得
    only_ranks = (only_ranks << session[:answer_rate]).sort.reverse
    @current_rank = only_ranks.index(session[:answer_rate]) + 1

    # フラッシュメッセージ
    if session[:correct_answer].present? && session[:answer_rate].present?

      flash.now[:notice] = "お疲れ様でした!
      あなたの成績は、5問中#{session[:correct_answer]}問正解！！
      正解率#{session[:answer_rate]}%で、あなたの順位は#{@current_rank}位です"

    end

  end
end
