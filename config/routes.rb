Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks'
  }

  authenticated :user do
    root to: 'products#index', as: :authenticated_root
  end

  devise_scope :user do
    root to: 'devise/sessions#new', as: :unauthenticated_root
  end

  resources :products, only: [:index, :create, :new]
  resources :orders, only: [:index, :show, :create, :destroy] do
    member do
      patch :complete
      get :pdf, to: 'orders#pdf'
    end
  end
  resources :order_items, only: [:create, :destroy]
end
