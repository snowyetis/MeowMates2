require 'resque/server'

Rails.application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)

  resources :posts, :animals, :animal_details, :adoption_animals
  resources :comments, only: [:create, :destroy]
  resources :events, except: [:edit, :update]

  devise_for :users
  resources :users do
    member do
      get :animals
      get :friends
      get :followers
      get :deactivate
      get :mentionable
    end
  end

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end
  resources :notifications
  resources :messages, only: [:new, :create]

  get :survey_attempts, to: 'user_surveys/attempts#new'
  post :survey_attempts, to: 'user_surveys/attempts#create'

  # resources :admin_surveys do
  #   resources :attempts, :surveys
  # end

  get 'show_gallery_detail/:id', to: 'animals#show_gallery_detail', as: 'show_gallery_detail'
  get 'show_rating_form', to: 'animals#show_rating_form', as: 'show_rating_form'
  get 'show_adoption_form', to: 'animals#show_adoption_form', as: 'show_adoption_form'

  authenticated :user do
    root to: 'home#index', as: 'home'
  end

  unauthenticated :user do
    root 'home#front'
  end

  # scope :ujs, defaults: { format: :ujs } do
  #   patch 'check_and_show_form' => 'animals#check_and_show_form'
  # end

  match :follow, to: 'follows#create', as: :follow, via: :post
  match :unfollow, to: 'follows#destroy', as: :unfollow, via: :post
  match :like, to: 'likes#create', as: :like, via: :post
  match :unlike, to: 'likes#destroy', as: :unlike, via: :post
  match :adoption_create, to: 'messages#adoption_create', as: :adoption_create, via: :post
  match :find_friends, to: 'home#find_friends', as: :find_friends, via: :get
  match :find_animals, to: 'home#find_animals', as: :find_animals, via: :get
  match :about, to: 'home#about', as: :about, via: :get


  mount Resque::Server.new, at: "/resque"


end
