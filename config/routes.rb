Rails.application.routes.draw do
  root 'static_pages#home'
  post 'rating', to: "rating#create"
  resources :movies
  devise_for :users
  resources :genre, only: [:show]
  resources :valid_categories
end
