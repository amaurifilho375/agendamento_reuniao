Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  resources :reserves
  resources :livin_rooms
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end