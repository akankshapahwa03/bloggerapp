class CommentsController < ApplicationController
  before_action :set_comment, only: :destroy
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
  
    if @comment.save
      redirect_to @post
      flash[:notice] = "Comment created successfully"
    else
      @comments = @post.comments
      render 'posts/show'
      flash.now[:alert] = "Cannot create comment"
    end
  end
    
  def destroy
    @comment.destroy
    redirect_to @comment.post, notice: 'Comment was successfully deleted.'
  end
    
  private
    
  def set_comment
    @comment = Comment.find(params[:id])
  end
   
  def comment_params
    params.require(:comment).permit( :body, :parent_id)
  end
end