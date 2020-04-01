class PostsController < ApplicationController
  
  before_action :set_params, only: [:edit, :update, :show]
  before_action :todays_theme, except: :destroy
  before_action :move_to_index, except: [:index, :show, :search, :rank, :past]
 
  def index
    @best = Post.todays_post.first
    @best_one = Post.best_post_for_all.first
    @yesterday_posts = Post.where(created_at: Time.zone.yesterday.beginning_of_day..Time.zone.yesterday.end_of_day).order("created_at DESC").page(params[:page]).per(20)
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(20)
    @today_posts = Post.includes(:user).where("created_at > ?", Time.zone.today.beginning_of_day).order("created_at DESC").page(params[:page]).per(10)
    @yesterday_posts = Post.includes(:user).where(created_at: Time.zone.yesterday.beginning_of_day...Time.zone.today.beginning_of_day).order("created_at DESC").page(params[:page]).per(10)
    @old_posts = Post.includes(:user).where("created_at < ?", Time.zone.yesterday.beginning_of_day).order("created_at DESC").page(params[:page]).per(10)
    @yesterday_theme = Theme.find(yesterday_num)
    unless @best.nil?
      if Like.count != 0
        @likes = Like.where(post_id: @best.id).count
      end
      if Favorite.count != 0
        @favorites = Favorite.where(post_id: @best.id).count
      end
    end      
  end

  def new
    @post = Post.new
    @ex_post = Post.where(user_id: current_user.id).where("created_at> ?", Time.zone.today.beginning_of_day).first
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path 
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to "/users/#{post.user.id}"
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @user = @post.user
    @like = Like.new
    @likes_count = Like.where(post_id: params[:id]).count
    @theme = Theme.where(post_id: params[:id])
    @favorite = Favorite.new
    @favorites_count = Favorite.where(post_id: params[:id]).count
  end

  def search
    @posts = Post.search(params[:keyword])
    @likes_count = Like.where(post_id: params[:id]).count
  end

  def thanks
  end

  private
  def post_params
    params.require(:post).permit(:title, :image, :message, :start_time, :theme_ids).merge(user_id: current_user.id)
  end

  def set_params
    @post = Post.find(params[:id])
  end

  def todays_theme
    @today_theme = Theme.find(today_num)
  end

  def move_to_index
    redirect_to posts_path unless user_signed_in?
  end

  def today_num
    if Time.now.wday == 0
       return 1
    else
       return Time.now.day
    end
  end

  def yesterday_num
  if Date.yesterday.wday == 0
       return 1
    else
       return Date.yesterday.day
    end
  end


end
