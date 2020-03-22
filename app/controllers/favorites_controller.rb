class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.create(post_id: params[:post_id])
    if @favorite.save
      redirect_to "/posts/#{params[:post_id]}"
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    if @favorite.destroy
      redirect_to "/posts/#{params[:post_id]}"
    end
  end

end
