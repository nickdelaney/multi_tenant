Rails.application.routes.draw do


  root to: "admin/dashboard#index"

  namespace :admin do
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
      match 'editProfile', to: 'users#editProfile', via: :get
      match 'editProfile', to: 'users#updateProfile', via: :post
      resources :students
      resources :auto_billings
      collection do
       get 'faculty'
      end
    end

  resources :auto_billings do
    collection do
      get 'bill_users'
    end
  end
  end

  
  resources :payments
  devise_for :users
  

  
end
