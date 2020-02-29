class ThemesController < ApplicationController
  before_action :set_params, only: :show

  def index
    @themes = Theme.all
  end

  def show
    @themes = @theme.posts.all
  end

  def set_params
    @theme = Theme.find(params[:id])
  end

end
