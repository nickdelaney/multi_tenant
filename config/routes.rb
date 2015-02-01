Rails.application.routes.draw do
  root 'franchises#index'
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :franchises
  resources :buses
  resources :preschools
  resources :students
  resources :sections

  
end
