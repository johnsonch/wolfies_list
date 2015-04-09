class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        login(user)
        redirect_to(user)
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'The username or password is invalid.'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
  
  
end
