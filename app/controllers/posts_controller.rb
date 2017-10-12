class PostsController < ApplicationController
before_action :set_post, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post mis à jour"
      redirect_to @post
    else
      flash.now[:alert] = "Post non mis à jour"
      render "edit"
    end
  end

  def destroy
    @post.destroy

    flash[:notice] = "Post supprimé"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:name, :description, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Le post que vous cherchez n'a pas pu être trouvé"
    redirect_to posts_path
  end
end
