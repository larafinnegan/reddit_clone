class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comments_params)
  end

  private

  def comments_params
    params.require(:comments).permit(:content)
  end
end
