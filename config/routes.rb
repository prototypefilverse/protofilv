Rails.application.routes.draw do
  devise_for :users
  root to: 'filvs#index'
  resources :filvs, only: :index

  resources :movies do
    resources :reviews, only: [:new, :create]
    
  end


end
