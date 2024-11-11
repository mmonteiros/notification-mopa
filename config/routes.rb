Rails.application.routes.draw do
  # Defines the routes for the Coupon API
  get 'notification', to: 'notification#show', as: 'get_notification'
  post 'notification', to: 'notification#create', as: 'create_notification'
end
