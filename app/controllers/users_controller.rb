class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(post_params)
    if @user.save
      redirect_to login_path, notice: 'Successfully registered, now login'
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