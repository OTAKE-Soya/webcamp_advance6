Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: "users/sessions"}
  
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  
  root 'homes#top'
  get 'home/about' => 'homes#about'
end