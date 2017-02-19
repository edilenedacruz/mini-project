class SessionsController < ApplicationController
  # before_action :authorize!

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in!"
      redirect_to user_path(current_user)
    else
      flash.now[:notice] = "Try again!"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You are now logged out."
    redirect_to login_path
  end
end
