# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    get 'order/new'
    get 'order/create'
    get 'order/update'
  end

  namespace :api do
    resources :items
  end
  root to: 'items#index'

  namespace :api do
    namespace :v1 do
      resources :customers
    end
  end

  resources :customers
  resources :items
  resources :cards, only: %i[index show] do
    member do
      get 'trello', to: 'cards#trello'
      get 'wicked_pdf', to: 'cards#wicked_pdf'
      get 'image', to: 'cards#image'
    end
  end
end
