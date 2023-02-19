# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :items
  end

  namespace :api do
    namespace :v1 do
      resources :customers
    end
  end

  resources :customers
  resources :items
  resources :orders, only: %w(index new create)
  resources :fabrics, only: %w(index new create)

  resources :cards, only: %i[index show] do
    member do
      get 'trello', to: 'cards#trello'
      get 'wicked_pdf', to: 'cards#wicked_pdf'
      get 'image', to: 'cards#image'
    end
  end

  root to: 'items#index'
end
