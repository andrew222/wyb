class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :current_user_session

  private
  def current_user_session
    return @current_user_session unless @current_user.blank?
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user unless @current_user.blank?
    @current_user = current_user_session && current_user_session.user
  end

  def require_user
    if current_user.blank?
      flash[:notice] = "请先登录."
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    unless current_user.blank?
      flash[:notice] = "请先退出."
      redirect_to users_url
      return false
    end
  end
end
