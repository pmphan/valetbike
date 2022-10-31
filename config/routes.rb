Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  
  #pls delete once webpage is set
  match 'about', to: 'about#index', via: 'get'
  match 'home', to: 'home#index', via: 'get'
  match 'rent', to: 'rent#index', via: 'get'

  #match '/map/:id', to: 'map#show', via: 'get'
  get 'help'    => 'help#index'
  get 'home/index'
  get 'login/index'
  get 'rent/index'
end
