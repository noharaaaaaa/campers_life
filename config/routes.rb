Rails.application.routes.draw do
  devise_for :users
  resources :users, only:[:show, :edit, :update]
  root to: 'posts#index'
  resources :posts
end
