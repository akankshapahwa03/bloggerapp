class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_categories

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(id: :desc)

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

      if @post.save
        redirect_to @post
      else
        render :new, status: :unprocessable_entity
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
  end


  private
    def post_params
      params.require(:post).permit(:title, :description, :category_id)
    end

    def set_categories
      @categories = Category.all.order(:name)
    end
end