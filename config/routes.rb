# frozen_string_literal: true

Rails.application.routes.draw do # rubocop:disable Metrics/BlockLength
  devise_for :users, controllers: { sessions: 'trestle/auth/sessions' }

  namespace :orders do
    resources :create_new_order, only: %i[create]
  end
  namespace :api do
    resources :items
  end

  namespace :api do
    namespace :v1 do
      resources :customers
    end
  end

  resources :items
  resources :customers, only: %w[index new create]
  resources :orders, only: %w[index show new]
  resources :fabrics, only: %w[index new create]

  resources :cards, only: %i[index show] do
    member do
      get 'trello', to: 'cards#trello'
      get 'wicked_pdf', to: 'cards#wicked_pdf'
      get 'image', to: 'cards#image'
    end
  end

  post '/webhooks/trello/*path', to: 'webhooks/trello#create', via: :all
  get '/webhooks/trello/*path', to: 'webhooks/trello#index', via: :all

  resources :tracking, only: %i[show]

  root to: 'items#index'
end
