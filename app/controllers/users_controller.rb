class UsersController < ApplicationController
  before_action :require_user, except: [:index, :search, :new, :create]
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    users = User.all.order("created_at desc")
    unless current_user.blank?
      users = users.where.not(id: current_user.id)
    end
    @users = users
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.birthday = translate_birthday(user_params["birthday(1i)"], user_params["birthday(2i)"], user_params["birthday(3i)"])
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path }
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
    birthday = translate_birthday(user_params["birthday(1i)"], user_params["birthday(2i)"], user_params["birthday(3i)"])
    respond_to do |format|
      if @user.update({nickname: user_params[:nickname], first_name: user_params[:first_name], last_name: user_params[:last_name], avatar: user_params[:avatar], birthday: birthday, born_at: user_params[:born_at]})
        format.html { redirect_to users_path }
      else
        flash[:notice] = "不能更新个人信息."
        format.html { render :edit }
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
      params.require(:user).permit(:email, :nickname, :first_name, :last_name, :avatar, :password, :password_confirmation, :birthday, :born_at)
    end

    def translate_birthday(year="2015", month="11", day="25")
      return "#{year}-#{month}-#{day}".to_date
    end
end
