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
      post.update(title: post_params[:title], text: post_params[:text])
    end
  end

  def new
    @posts = Post.new
  end

  def create
#    Post.create(text: params[:post][:text], user_id: current_user.id)
    Post.create(title: post_params[:title], text: post_params[:text], user_id: current_user.id) if user_signed_in?
  end

  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.destroy
    end
  end

  private
  def post_params
    params[:post].permit(:title, :text)
  end

end
