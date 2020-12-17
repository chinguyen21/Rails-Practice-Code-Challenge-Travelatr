class PostsController < ApplicationController
 
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def update_likes

    @post = Post.find(params[:id])
    new_likes = @post.likes + 1
    @post.update(likes: new_likes)
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to @post
  end



  private

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end
end