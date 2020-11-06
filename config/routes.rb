Rails.application.routes.draw do

  get 'relationships/create'
  get 'relationships/destroy'
  root 'home#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  delete "books/:id" => "books#destroy"
  
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end
  
  resources :top
  # post "books/:id" => "books#show"
  get "home/about" => "home#show"
end
