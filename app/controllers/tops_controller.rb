class TopsController < ApplicationController
  
  def index
  end

  def show
    @theme = Theme.all
  end

end
