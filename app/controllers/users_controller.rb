class UsersController < ApplicationController
  before_action :today_theme, only: [:index, :show]

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname 
    @post = @user.posts.where("created_at > ?", Time.zone.today.beginning_of_day)
    @posts = @user.posts.order("created_at DESC").page(params[:page]).per(20)
    @liked = @user.liked_posts.order("created_at DESC").page(params[:page]).per(20)
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  # def move_to_index  
  #   redirect_to action: :index unless user_signed_in?
  # end
  
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
  