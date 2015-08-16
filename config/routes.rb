Rails.application.routes.draw do
  get 'new_ship' => 'visitors#new_ship'
  get 'about' => 'visitors#about'
  root to: 'visitors#index'
  devise_for :users
end
