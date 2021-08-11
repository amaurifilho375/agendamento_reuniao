Rails.application.routes.draw do
  #get 'home/index'
  root 'home#index'


  #resources :home, only: [:edit, :create, :show]


  get 'home/teste'

  resources :home, only: [:edit, :show, :create]



  #patch '/home/:id', to: 'home#teste' , as: 'teste'

  #post 'home', controller: 'home', action: 'create'

  #resources :home
  resources :reserves
  resources :livin_rooms
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
