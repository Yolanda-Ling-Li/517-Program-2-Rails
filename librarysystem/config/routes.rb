Rails.application.routes.draw do
  resources :book_histories
  devise_for :users
  get 'books/:id/borrow' => 'books#borrow', :as => :borrow_book
  get 'books/:id/return' => 'books#return', :as => :return_book
  get 'book_histories/:data/index' => 'book_histories#index', :as =>:check_user_history

  resources :books
  resources :libraries
  root to: "home#index"
  # root to: "libraries#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
