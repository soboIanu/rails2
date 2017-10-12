class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Post effectué"
      redirect_to @post
    else
      flash.now[:alert] = "Post non effectué"
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post mis à jour"
      redirect_to @post
    else
      flash.now[:alert] = "Post non mis à jour"
      render "edit"
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :description, :content)
  end
end
