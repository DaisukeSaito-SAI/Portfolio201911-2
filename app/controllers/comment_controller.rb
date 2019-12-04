class CommentController < ApplicationController
  
  def create
        @comment = Comment.new(post_id: params[:id],
                               comment: params[:comment])
        @comment.save
        redirect_to "/posts/#{params[:id]}"
  end
  
end
