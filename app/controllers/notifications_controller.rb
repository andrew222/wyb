class NotificationsController < ApplicationController
  before_action :require_user
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  # GET /notifications
  # GET /notifications.json
  def index
    @send_to_me = current_user.notifications
    @send_by_me = current_user.sent_notifications
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
    @notification.status = "read"
    @notification.save
  end

  # GET /notifications/new
  def new
    @notification = Notification.new(receiver_id: params[:uid])
  end

  # GET /notifications/1/edit
  def edit
    if @notification.sender == current_user
      if @notification.update(notification_params)
        render :index
      else
        render :edit
      end
    end
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(notification_params)
    @notification.sender_id = current_user.id

    unless @notification.save
      format.js { render js: "console.log(#{@notification.errors.inspect})" }
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: 'Notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:title, :content, :receiver_id)
    end
end
