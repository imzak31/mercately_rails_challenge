Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: 'products#index', as: :authenticated_root
  end

  devise_scope :user do
    root to: 'devise/sessions#new', as: :unauthenticated_root
  end

  resources :products, only: [:index, :create]
  resources :orders, only: [:index, :show, :create, :destroy]
  resources :order_items, only: [:create, :destroy]
end
