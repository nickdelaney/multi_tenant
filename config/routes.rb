Rails.application.routes.draw do
  
  resources :franchises
  resources :buses

  root 'franchises#index'
end
