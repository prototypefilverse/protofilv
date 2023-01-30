Rails.application.routes.draw do
  root to: 'filvs#index'
  resources :filvs
end
