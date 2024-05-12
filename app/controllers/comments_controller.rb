class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(parent_id: params[:parent_id])
  end
 
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      @comments = @post.comments 
      render 'posts/show'
    end
  end
  def create_reply
    @comment = Comment.find(params[:parent_id])
    @reply = @comment.replies.build(reply_params)
    if @reply.save
      # Handle successful reply creation
    else
      # Handle reply creation failure
    end
  end
  
  
    def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.destroy
      redirect_to post_path(@post), status: :see_other
    end
   
    private
    def comment_params
      params.require(:comment).permit(:user_id, :body, :parent_id)
    end
  
  def reply_params
    params.require(:comment).permit(:body) # Add any other permitted parameters
  end
  
  end