Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get "/my_profile", to: "users#profile"

  resources :heros, only: %i[index show]
  resources :maps, only: %i[index show]
  resources :matches
end
