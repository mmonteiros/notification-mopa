class NotificationController < ApplicationController
  def show
    if !params[:name].present?
      render json: {
        notification: {
          name: 'Find your best clothes here!',
        }
      }, status: :ok
    else
      notification = Notification.find_by(name: params[:name])
      if notification
        render json: {
          notification: {
            name: notification.name
          }
        }, status: :ok
      else
        render json: { error: "Notification not found" }, status: :not_found
      end
    end
  end

  def create
    notification = Notification.new(notification_params)
    if notification.save
      render json: { notification: notification }, status: :created
    else
      render json: { errors: notification.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:name)
  end
end

