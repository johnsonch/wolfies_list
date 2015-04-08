class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      #log the user in
      login(user)
      #show them their profile
      redirect_to(user)
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
