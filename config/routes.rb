Rails.application.routes.draw do
  get 'about' => 'visitors#about'
  root to: 'visitors#index'
  devise_for :users
end
