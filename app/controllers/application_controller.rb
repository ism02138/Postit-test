class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery # with: :exception

  config.time_zone = 'Eastern Time (US & Canada)'
  helper_method :current_user, :logged_in? # can be used in controller and view

  def require_admin
    access_denied unless current_user && current_user.admin?
  end

  def current_user # returns current user based on user_id
    @current ||= User.find(session[:user_id]) if session[:user_id] # memoization, if current nil then execute the rest
  end

  def logged_in? # turn into boolean
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:error] = 'You must be logged in'
      redirect_to root_path
    end
  end

  def access_denied
    flash[:error] = "You can't do that"
    redirect_to root_path
  end

  def does_not_exist
    flash[:error] = "Path does not exist"
    redirect_to root_path
  end
end
