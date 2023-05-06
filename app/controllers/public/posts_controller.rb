class Public::PostsController < ApplicationController

  def index
    @posts = Post.all
    @post_page = Post.page(params[:page]).per(8)

  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end


# 投稿データのストロングパラメータ
  private

  def post_params
    params.require(:post).permit(:title, :image, :body)
  end

end