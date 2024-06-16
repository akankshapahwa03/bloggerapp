Rails.application.routes.draw do

  root 'posts#index'
  devise_for :users 
  resources :messages, only: [:index, :new, :create]

  get 'static_pages/about'
  resources :dashboard

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments do
      resources :likes, only: [:create, :destroy]
    end
  end
end
