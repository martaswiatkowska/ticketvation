# frozen_string_literal: true


Rails.application.routes.draw do
  require 'sidekiq/web'
  resources :events
  resources :reservations, only: [:index, :new, :create]
  get "reservation/payment"
  mount Sidekiq::Web => "/sidekiq"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
