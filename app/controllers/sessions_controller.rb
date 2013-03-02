class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user.present?
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_url
      end
    else
      redirect_to :login, notice: 'Username or password not recognized'
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end

end
