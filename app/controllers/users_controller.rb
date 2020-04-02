class UsersController < ApplicationController
  before_action :today_theme, only: [:index, :show]
  before_action :authenticate_user!, only: [:index, :show]

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname 
    @post = @user.posts.find_by(created_at: Time.zone.today.beginning_of_day...Time.zone.today.end_of_day)
    @posts = @user.posts.order("created_at DESC").page(params[:page]).per(20)
    @liked = @user.liked_posts.order("created_at DESC").page(params[:page]).per(20)
    @faved = @user.fav_posts.order("created_at DESC").page(params[:page]).per(20)
    @following = @user.followings
    @likes_count = Like.where(post_id: params[:id]).count
    @favorites_count = Favorite.where(post_id: params[:id]).count
    gon.user_gender = @user.gender
  end


  private
  
  def today_theme
    @today_theme = Theme.find(today_num)
  end

  def today_num
    if Time.now.wday == 0
       return 1
    else
       return Time.now.day
    end
  end
  
end
  