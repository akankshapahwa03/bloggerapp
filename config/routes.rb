Rails.application.routes.draw do

  devise_for :users 
    namespace :admin do
      resources :dashboard
  end

  root 'posts#index'
  get 'static_pages/about'
  resources :posts do
    resources :comments
    end
end
