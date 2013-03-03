class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_url, notice: "Welcome back, #{user.username.capitalize}"
      return
    end
    redirect_to :login, notice: 'Username or password not recognized'
  end

  def destroy
    reset_session
    redirect_to root_url
  end

end
