Rails.application.routes.draw do
  root to: 'journals#index'
  resources :journals
  devise_for :users
end
