Rails.application.routes.draw do
  get 'books/:id/borrow' => 'books#borrow', :as => :borrow_book

  resources :books
  resources :libraries
  root 'libraries#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
