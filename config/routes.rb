Rails.application.routes.draw do
  root "home#index"
  devise_for :users, module: "users"
  resources :stations
  resources :users

  #pls delete once webpage is set
  match 'about', to: 'about#index', via: 'get'

  get 'home'    => 'home#index'
  get 'about'    => 'about#index'
  get 'help'    => 'help#index'

  get 'home/map' => 'home#map'
  get 'memberships'  => 'memberships#index'

  get 'billing' => 'billing#show'

end
