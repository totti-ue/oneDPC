class UsersController < ApplicationController

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname 
    @posts = @user.posts.order("created_at DESC").page(params[:page]).per(4)
    @liked = @user.liked_posts.order("created_at DESC").page(params[:page]).per(4)
  end

  def move_to_index  
    redirect_to action: :index unless user_signed_in?
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
  