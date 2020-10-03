class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "You have successfully logged in."
    else
      flash.now[:alert] = "name or password is invalid."
      render :new
    end
  end
end
