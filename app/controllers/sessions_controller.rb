class SessionsController < ApplicationController
  def new
  end

  def create
      # if user exists and password correct
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      # failure, render login form
      redirect_to '/login', :flash => { :error => 'Error logging in, please check your email/password.' }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
