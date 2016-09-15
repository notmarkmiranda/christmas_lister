class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to dashboard_path
    end
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "You're logged in!"
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash.now[:danger] = "Something went wrong."
      render :new
    end
  end
end
