class PostsController < ApplicationController
  before_action :only_logged_in, only: [:new, :edit, :create, :update, :destroy]
  before_action :only_current_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post.redis_access
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.email = current_user.email
    @post.save
    redirect_to @post
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def only_logged_in
    if !user_signed_in?
      redirect_to root_url
    end
  end

  def only_current_user
    @post = Post.find(params[:id])
    if current_user.email != @post.email
      flash[:alert] = "Not yours"
      redirect_to posts_url
    end
  end

end
