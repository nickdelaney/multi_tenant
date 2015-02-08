Rails.application.routes.draw do


  root to: "admin/dashboard#index"

  namespace :admin do
  	get '', to: 'dashboard#index', as: '/'
  	resources :posts
  	resources :buses
  	resources :students
  	resources :franchises
  	resources :preschools
  	resources :sections
    resources :users do
      resources :students
      collection do
       get 'faculty'
      end
    end

  end

  

  devise_for :users
end
