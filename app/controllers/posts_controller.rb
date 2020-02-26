class PostsController < ApplicationController
  before_action :set_params, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]
 
  def index
    # @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(10)
    @posts = Post.includes(:user).where("created_at > ?", Date.today).order("created_at DESC").page(params[:page]).per(10)
    @today_theme = Theme.first
    @themes = Theme.includes(:post_id)
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
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  def rank
    @all_ranks = Post.create_all_ranks
    @today_theme = Theme.first
  end

  private
  def post_params
    params.require(:post).permit(:title, :image, :theme_ids).merge(user_id: current_user.id)
  end

  def set_params
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
