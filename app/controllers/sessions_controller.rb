class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password]) # user for nil condition
      session[:user_id] = user.id # save id into the session, cookie has limited space
      redirect_to root_path, notice: 'Welcome, login successful'
    else
      flash[:error] = 'Invalid username or password'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logout successful'
  end
end
