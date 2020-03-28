class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :detect_devise_variant

  # サインイン後のリダイレクト先をマイページへ
  def after_sign_in_path_for(resource)
    posts_path  #指定したいパスに変更
  end

  # サインアウト後のリダイレクト先をトップページへ
  def after_sign_out_path_for(resource)
    posts_path
  end

  private
  def detect_devise_variant  # (1)と同じ名前
    ua = request.user_agent
    if(ua.include?('Mobile') || ua.include?('Android'))
      request.variant = :mobile 
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :avator, :gender, :age, :introduction])
  end
end
