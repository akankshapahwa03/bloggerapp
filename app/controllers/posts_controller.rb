class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_categories

  def index
    @posts = Post.all.order(:created_at)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = @post.comments.new(parent_id: params[:parent_id])
    @comments = @post.comments.order(id: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    
      if @post.save
        redirect_to @post
        flash[:notice] = "Post created successfully!"
      else
        render 'new', status: :unprocessable_entity
        flash[:alert] = "Post could not be created!"
      end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to @post
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
    flash[:notice] = "Post deleted successfully!"
 
  end


  private
    def post_params
      params.require(:post).permit(:title, :description, :category_id, :user_id)
    end

    def set_categories
      @categories = Category.all.order(:name)
    end
end
