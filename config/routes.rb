Rails.application.routes.draw do
  root "home#index"
  devise_for :users, module: "users"

  #pls delete once webpage is set
  match 'about', to: 'about#index', via: 'get'
  match 'rent', to: 'rent#index', via: 'get'

  #match '/map/:id', to: 'map#show', via: 'get'
  get 'home'    => 'home#index'
  get 'about'    => 'about#index'
  get 'help'    => 'help#index'
  get 'stations/mapJSON'    => 'stations#mapJSON'
  get 'rent/index'
end
