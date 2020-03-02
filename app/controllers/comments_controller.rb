class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to "/posts/#{@comment.post.id}"  }
      format.json
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to "/posts/#{params[:post_id]}"
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, post_id: params[:post_id])
  end

end
