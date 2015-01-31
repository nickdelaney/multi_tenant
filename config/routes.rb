Rails.application.routes.draw do
  resources :franchises

  root 'franchises#index'
end
