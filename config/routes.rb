Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  get 'home/about' => 'homes#about', as: 'about'
  resources :homes, only: [:about]
  resources :users
  resources :books
end
