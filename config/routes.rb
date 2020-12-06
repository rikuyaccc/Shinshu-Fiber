Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "home#index"
  get 'home/myself'
  get 'home/terms'
  get 'home/privacy'

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :classrooms, only: [:index, :show, :create] do
    resource :reviews, only: [:create]
    get :rate, on: :member
    collection do
      get :timetable
      get :search_class
    end
  end

  resources :users, only: [:index, :show] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :clubs

  resources :rooms, only: [:index, :show, :create]
  resources :messages, only: [:create, :edit, :update, :destroy]
  
end
