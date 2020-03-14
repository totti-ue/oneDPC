class ThemesController < ApplicationController
  before_action :set_params, only: :show
  before_action :todays_theme, only: [:index, :show]

  def index
    @themes = Theme.all
  end

  def show
    @themes = @theme.posts.all.page(params[:page]).per(20)
  end

  private

  def set_params
    @theme = Theme.find(params[:id])
  end


  def todays_theme
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
