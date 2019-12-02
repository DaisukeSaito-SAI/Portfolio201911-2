class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(
      name: params[:session][:name],
      email: params[:session][:email].downcase)
  if @user
    log_in @user
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
