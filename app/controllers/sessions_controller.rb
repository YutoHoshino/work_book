class SessionsController < ApplicationController
  skip_before_action :login_required
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:alert] = 'ユーザー名又はパスワードが違います'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path notice: 'ログアウトしました'
  end

end
