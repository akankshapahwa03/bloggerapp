class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_likeable

  def create
    @like = @likeable.likes.build(user: current_user)
    if @like.save
      flash[:success] = "Liked successfully"
    else
      flash[:error] = "Unable to like"
    end
    redirect_back fallback_location: root_path
  end

  def destroy
    @like = @likeable.likes.find(params[:id])
    if @like.destroy
      flash[:success] = "Unliked successfully"
    else
      flash[:error] = "Unable to unlike"
    end
    redirect_back fallback_location: root_path
  end

  private

  def find_likeable
    if params[:comment_id]
      @likeable = Comment.find_by(id: params[:comment_id])
    elsif params[:post_id]
      @likeable = Post.find_by(id: params[:post_id])
    end

    
    unless @likeable
      flash[:error] = "Likeable object not found"
      redirect_back fallback_location: root_path
    end
  end
end

