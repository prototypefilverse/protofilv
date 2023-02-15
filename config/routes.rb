Rails.application.routes.draw do
  devise_for :users
  root to: 'filvs#index'
  resources :filvs, only: :index
  resources :reviewers, only: [:index, :destroy]

  resources :movies, only: [:index] do
    resources :filvs, only: [:index, :new, :create]
    resources :reviews, only: [:new, :create] do
      resources :ratings, only: [:create]
    end  
  end
  
end
