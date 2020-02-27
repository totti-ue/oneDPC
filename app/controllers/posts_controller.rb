class PostsController < ApplicationController
  before_action :set_params, only: [:edit, :show]
  before_action :todays_theme, except: [:create, :destroy, :edit, :update]
  before_action :move_to_index, except: [:index, :show, :search]
 
  def index
    # @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(10)
    @posts = Post.includes(:user).where("created_at > ?", Date.today).order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to action: :index 
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def edit
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @user = @post.user
    @like = Like.new
    @likes_count = Like.where(post_id: params[:id]).count
    @theme = Theme.where(post_id: params[:id])
  end

  def search
    @posts = Post.search(params[:keyword])
    @likes_count = Like.where(post_id: params[:id]).count
  end

  def rank
    @all_ranks = Post.create_today_ranks
    @rank_first = @all_ranks.first
    @rank_second = @all_ranks.second
    @rank_third = @all_ranks.third
   
  end

  def past
    @posts = Post.includes(:user).where("created_at < ?", Date.today).order("created_at DESC").page(params[:page]).per(10)
    @themes = Theme.includes(:post_id)
  end

  private
  def post_params
    params.require(:post).permit(:title, :image, :theme_ids).merge(user_id: current_user.id)
  end

  def set_params
    @post = Post.find(params[:id])
  end

  def todays_theme
    @today_theme = Theme.find(today_num)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def today_num
    if Time.now.wday == 0 or Time.now.wday == 6
       return 1
    else
       return Time.now.day
    end
  end

end
