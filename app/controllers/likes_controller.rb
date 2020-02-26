class LikesController < ApplicationController

  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    if @like.save
      # flash[:success] = "いいね登録しました"  # 希望で
      redirect_to "/posts/#{params[:post_id]}"
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    if @like.destroy
      # flash[:success] = "いいね解除しました"　# 希望で
      redirect_to "/posts/#{params[:post_id]}"
    end
  end


end
