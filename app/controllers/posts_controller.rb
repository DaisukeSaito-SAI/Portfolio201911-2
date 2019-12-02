class PostsController < ApplicationController
  
  def index
    @posts = Post.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @post = Post.new()
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/")
  end

  def create
    @post = Post.new(user_params)
    @post.user_id = session[:user_id]
    if @post.save
      redirect_to "/"
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:post).permit(:content)
    end
  
end
