class UsersController < ApplicationController
  before_action :require_user, except: [:index, :search, :new, :create]
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        redirect_to users_path
      else
        flash[:notice] = "不能更新个人信息."
        render :edit
      end
    end
  end

  def search
    keyword = params[:q] || ""
    lanName = params[:lanName] || ""

    @users = User.includes(:languages).references(:languages).where("users.email LIKE ? OR languages.name LIKE ?", "%#{keyword}%", "%#{lanName}%")
  end
  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :nickname, :first_name, :last_name, :avatar, :password, :password_confirmation, :born_at)
    end
end
