class ChannelsController < ApplicationController
  before_action :require_user
  before_action :set_channel, only: [:new]

  def new
    if @channel.blank?
      receiver_id = 3
      @channel = current_user.channels.create({
        sender_id: current_user.id,
        receiver_id: receiver_id
      })
    end
  end

  private

    def set_channel
      @channel = current_user.channels.find_by_receiver_id(3)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channel_params
      params.require(:channel).permit(:receiver_id)
    end
end
