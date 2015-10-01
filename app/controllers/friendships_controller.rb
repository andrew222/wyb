class FriendshipsController < ApplicationController
  before_action :require_user
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  def index
    @friends = current_user.friends
  end

  def add
    @friendship = current_user.friendships.build(friend_id: params[:id])
    unless @friendship.save
      render js: "alert('找不到此用户')"
    else
      @user_id = @friendship.friend_id
    end
  end

  def remove
    @friendship = current_user.friendships.find_by_friend_id(params[:id])
    unless @friendship.destroy
      render js: "alert('找不到此用户')"
    else
      @user_id = @friendship.friend_id
    end
  end

  def destroy
    unless @friendship.blank?
      @friendship_id = @friendship.id
      @friendship.destroy
    else
      render js: "alert('找不到此好友')"
    end
  end

  private

    def set_friend
      @friendship = current_user.friendships.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:friend_id)
    end
end
