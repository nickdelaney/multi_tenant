Rails.application.routes.draw do


  root to: "admin/dashboard#index"

  namespace :admin do
    resources :payments do
      collection do
        get 'newProfile'
      end
    end
    match 'payments/newProfile' => 'payments#newProfile', :via => :get
    resources :evaluations
    resources :conversations, only: [:index, :show, :destroy] do
      member do
        post :reply
        post :restore
        post :mark_as_read
      end
    end
    resources :messages, only: [:new, :create]

  	get '', to: 'dashboard#index', as: '/'
  	resources :posts
  	resources :buses
  	resources :students do
       get 'section' => 'students#section', :as => :section_student
       post 'enroll' => 'students#enroll', :as => :enroll_student
    end
  	resources :franchises
  	resources :preschools
  	resources :sections
    resources :rosters
    devise_scope :user do
      match '/registrations/create', to: 'registrations#create', via: :post
      match '/registrations/new', to: 'registrations#new', via: :get
    end

    resources :users do
      match 'newProfile', to: 'users#newProfile', via: :get
      match 'newProfile', to: 'users#createProfile', via: :post
      resources :students
      collection do
       get 'faculty'
      end
    end

  end
  
  resources :payments
  devise_for :users
  

  
end
