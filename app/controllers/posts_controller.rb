class PostsController < ApplicationController
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
      flash[:error] = 'Post creation failed'
      render 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = 'Post was successfully updated'
      redirect_to @post
    else
      flash[:error] = 'Post edit failed'
      render 'edit'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = 'Post was successfully deleted.'
      redirect_to root_path
    else
      flash[:error] = 'Post delete failed'
      redirect_to @post
    end
  end
  

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
