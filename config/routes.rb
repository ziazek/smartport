Rails.application.routes.draw do
  get 'new_ship' => 'visitors#new_ship'
  get 'incident_occurred' => 'visitors#incident_occurred'
  get 'about' => 'visitors#about'
  root to: 'visitors#index'
  devise_for :users
end
