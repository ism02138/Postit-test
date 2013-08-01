class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(post_params)
    if @user.save
      session[:user_id] = User.find_by(params[:username])
      redirect_to root_path, notice: 'Successfully registered, post away'
    else
      render :new
    end
  end

  def show
    @user = User.find_by slug: params[:id]
  end

  private

  def post_params
    params.require(:user).permit(:username, :password)
  end


end