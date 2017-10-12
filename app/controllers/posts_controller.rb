class PostsController < ApplicationController
  def index
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

  private

  def post_params
    params.require(:post).permit(:name, :description, :content)
  end
end
