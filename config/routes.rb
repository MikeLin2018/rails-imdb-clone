Rails.application.routes.draw do
  post 'rating', to: "rating#create"
  get 'rating/update'
  get 'static_pages/home'
  resources :movies
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  resources :genre, only: [:index, :show]
  resources :valid_categories
  resources :users
end
