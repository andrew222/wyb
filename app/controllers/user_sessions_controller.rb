class UserSessionsController < ApplicationController
  before_filter :require_no_user, only: [:new, :create]

  def new
    @user = UserSession.new
  end

  def create
    @user = UserSession.new(user_session_params)

    if @user.save
      flash[:notice] = "已经登录."
      redirect_to users_url
    else
      render :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "已经退出."
    redirect_to login_url
  end

  private

    def user_session_params
      params.require(:user_session).permit(:email, :password)
    end
end
