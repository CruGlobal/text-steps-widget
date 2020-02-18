Rails.application.routes.draw do
  resources :step_set_subscriptions, only: [:new, :create, :show]
end
