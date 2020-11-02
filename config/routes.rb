Rails.application.routes.draw do

  root 'home#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    resources :book_comments, only: [:create, :destroy]
  end
  
  delete "books/:id" => "books#destroy"
  resources :users
  resources :top
  # post "books/:id" => "books#show"
  get "home/about" => "home#show"
end
