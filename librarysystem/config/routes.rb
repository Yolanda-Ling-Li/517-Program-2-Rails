Rails.application.routes.draw do
  devise_for :users
  resources :libraries
  root to: "home#index"
  # root to: "libraries#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:update]
end
