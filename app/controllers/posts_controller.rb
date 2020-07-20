class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:success] = 'Post was successfully created'
      redirect_to @post
    else
      flash.now[:warning] = 'Post creation failed'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      flash[:success] = 'Post was successfully updated'
      redirect_to @post
    else
      flash.now[:warning] = 'Post edit failed'
      render 'edit'
    end
  end

  def show
    @comment = Comment.new(post_id: @post.id)
  end

  def destroy
    if @post.destroy
      flash[:success] = 'Post was successfully deleted.'
      redirect_to root_path
    else
      flash[:warning] = 'Post delete failed'
      redirect_to @post
    end
  end
  

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
