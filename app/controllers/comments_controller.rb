class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = 'Comment was successfully created'
      redirect_to post_path(@post)
    else
      flash.now[:warning] = 'Comment failed to create'
      render "posts/show"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:success] = 'Comment deleted'
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :content).merge(post_id: params[:post_id])
  end
end
