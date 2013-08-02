class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password]) # user for nil condition
      if user.two_factor_auth?
        # gen pin, send to twilio, sms to phone, show pin form
        session[:two_factor] = true
        user.generate_pin!
        user.send_pin_to_twilio
        redirect_to pin_path
      else
        session[:user_id] = user.id # save id into the session, cookie has limited space
        redirect_to root_path, notice: 'Welcome, login successful'
      end
    else
      flash[:error] = 'Invalid username or password'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logout successful'
  end

  def pin
    access_denied unless session[:two_factor]
    if request.post?
      user = User.find_by pin: params[:pin]
      if user
        # remove pin, login
        user.remove_pin!
        session[:two_factor] = nil
        session[:user_id] = user.id 
        redirect_to root_path, notice: 'Welcome, login successful'
      else
        flash[:error] = 'Incorrect Pin number'
        redirect_to pin_path 
      end
    end
  end  
end
