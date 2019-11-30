class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new()
  end
  
  def create
    @post = Post.new(user_params)
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
