Rails.application.routes.draw do

  get 'relationships/create'
  get 'relationships/destroy'
  root 'home#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
    get :search, on: :collection 
  end

  delete "books/:id" => "books#destroy"

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
    get :search, on: :collection
  end


  resources :top
  get "home/about" => "home#show"
end
