class UsersController < ApplicationController

  def index
    @users = User.where.not(id: current_user.id) #current_userの情報以外取得
  end

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname 
    @posts = @user.posts.order("created_at DESC").page(params[:page]).per(4)
    @liked = @user.liked_posts.order("created_at DESC").page(params[:page]).per(4)
  end

end
  