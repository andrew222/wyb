class PagesController < ApplicationController
  def update_status
    unless current_user.blank?
      current_user.update_column :last_online_time, Time.now
    end
    render nothing: true
  end

  def onlines
    names = User.select(:last_online_time, :nickname).onlines.pluck(:nickname)
    respond_to do |format|
      format.json {render json: {names: names}}
    end
  end
end
