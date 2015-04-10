class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        #log the user in
        login(user)
        #show them their profile
        redirect_to(user)
      else
        flash[:warning] = 'Your account isn\'t active, go check your email'
        redirect_to(root_url)
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
