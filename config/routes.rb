Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: "users/sessions"}
  
  resources :users,only: [:show,:index,:edit,:update] do
    member do
      get :following, :followers 
    end
  end
  
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  root 'homes#top'
  get 'home/about' => 'homes#about'
end