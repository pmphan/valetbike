Rails.application.routes.draw do
  root "home#index"
  devise_for :users, module: "users"
  resources :stations
  resources :users
  
  get 'ride/cancel' => 'ride#cancel', as: 'cancel_ride'
  resources :ride

  get 'home'    => 'home#index'
  get 'about'   => 'about#index'
  get 'help'    => 'help#index'

  get 'home/map' => 'home#map'

  # get 'memberships'  => 'memberships#index'

  get 'billing' => 'billing#show'
  get 'checkout/success' => 'checkout#success'
  get 'checkout/cancel' => 'checkout#cancel'
  get 'checkout/:id' => 'checkout#show', as: "checkout"
end
