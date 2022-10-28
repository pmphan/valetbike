Rails.application.routes.draw do
  root "home#index"
  
  #pls delete once webpage is set
  match 'about', to: 'about#index', via: 'get'
  match 'home', to: 'home#index', via: 'get'
  match 'help', to: 'help#index', via: 'get'
  match 'rent', to: 'rent#index', via: 'get'

  #match '/map/:id', to: 'map#show', via: 'get'

  get 'home/index'
  get 'help/index'
  get 'login/index'
  get 'rent/index'
end
