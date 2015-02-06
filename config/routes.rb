Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts

  namespace :admin do
  	get '', to: 'dashboard#index', as: '/'
  end
end
