class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :info, :error, :success

private

  def require_login
    unless current_user
      redirect_to root_url
    end
  end

  def current_user
    return unless session[:usuario_id]
      @current_user ||= Usuario.find(session[:usuario_id])
  end

  def logged_in?
    !!session[:user_id]
  end
end
