class UsersController < ApplicationController

  def login
    
  end
  
  def new
    @user = User.new()
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.update_attributes(user_params)
    redirect_to "/"
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to "/"
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end  
  
end
