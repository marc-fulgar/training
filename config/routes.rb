Rails.application.routes.draw do
  devise_for :posts
  resources :posts

  devise_for :departments
  resources :departments

  devise_for :users
  resources :users, except: [:edit, :new]
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
