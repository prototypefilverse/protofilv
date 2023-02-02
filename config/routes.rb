Rails.application.routes.draw do
  devise_for :users
  root to: 'filvs#index'
  resources :filvs, only: :index
end
