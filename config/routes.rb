# frozen_string_literal: true


Rails.application.routes.draw do
  require 'sidekiq/web'
  resources :events
  get "event-list", to: "events#event_list", as: "event-list"
  resources :reservations 
  mount Sidekiq::Web => "/sidekiq"
  resources :payments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
