# frozen_string_literal: true

Rails.application.routes.draw do
  resources :step_set_subscriptions, only: %i[new create show]

  post '/step_set_subscriptions/update', to: 'step_set_subscriptions#update'
end
