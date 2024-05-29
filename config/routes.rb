Rails.application.routes.draw do

  root 'posts#index'
  devise_for :users 
  
  get 'static_pages/about'
  resources :dashboard
  
  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy]
    end
end
