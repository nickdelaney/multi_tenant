Rails.application.routes.draw do


  devise_for :users
  root to: "posts#index"

  namespace :admin do
  	get '', to: 'dashboard#index', as: '/'
  	resources :posts
  	resources :buses
  	resources :students
  	resources :franchises
  	resources :preschools, path: "preschools"
  	resources :sections
  end
end
