class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
  if user && user.authenticate(params[:session][:password])
    log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
    redirect_to "/"
  else
    render 'new'
  end
  end
  
  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to "/"
  end

end
