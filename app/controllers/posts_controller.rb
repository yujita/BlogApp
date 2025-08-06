class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user).order('created_at DESC')

  end

  def show
    @post = Post.includes(:user).find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.update(post_params)
    end
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params.merge(user_id: current_user.id)) if user_signed_in?
  end

  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.destroy
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end
