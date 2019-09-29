Rails.application.routes.draw do

  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }
  devise_for :students, path: 'students', controllers: { sessions: "students/sessions" }
  devise_for :librarians, path: 'librarians', controllers: { sessions: "librarians/sessions" }
  devise_for :users

  resources :book_histories
  get 'books/:id/borrow' => 'books#borrow', :as => :borrow_book
  get 'books/:id/return' => 'books#return', :as => :return_book

  resources :books
  resources :libraries
  root to: "home#index"
  # root to: "libraries#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
