Rails.application.routes.draw do


  root to: "admin/dashboard#index"

  namespace :admin do
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
    resources :users do
      resources :students
      collection do
       get 'faculty'
      end
    end

  end

  

  devise_for :users
end
