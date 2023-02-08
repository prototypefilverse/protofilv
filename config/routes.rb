Rails.application.routes.draw do
  devise_for :users
  root to: 'filvs#index'
  resources :filvs, only: :index

  resources :movies do
    resources :reviews, only: [:new, :create]
  end

  resources :movies, only: [:index] do
    resources :filvs, only: [:index, :new, :create]
  end
  
end
