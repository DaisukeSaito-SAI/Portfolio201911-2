class RelationshipsController < ApplicationController
  def create
    @a = session[:user_id]
    @b = params[:id]
    
    @c = Relationship.new(follower_id: @a,
                          followed_id: @b)
    @c.save
    redirect_to "/users/#{@b}"
    
  end

  def destroy
    @a = session[:user_id]
    @b = params[:id]
    
    @c = Relationship.find_by(follower_id: @a,
                          followed_id: @b)
    if @c
      @c.destroy
      redirect_to "/users/#{@b}"
    else
      redirect_to "/"
    end
  end
end
