Rails.application.routes.draw do

  resources :posts, :animals
  resources :comments, only: [:create, :destroy]
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

  resources :events, except: [:edit, :update]
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

  get 'show_gallery_detail/:id', to: 'animals#show_gallery_detail', as: 'show_gallery_detail'

  authenticated :user do
    root to: 'home#index', as: 'home'
  end
  unauthenticated :user do
    root 'home#front'
  end

  match :follow, to: 'follows#create', as: :follow, via: :post
  # match :animal, to: 'animals#create', as: :animal, via: :post
  match :unfollow, to: 'follows#destroy', as: :unfollow, via: :post
  match :like, to: 'likes#create', as: :like, via: :post
  match :unlike, to: 'likes#destroy', as: :unlike, via: :post

  # match :animal_adoption, to: 'animals#send_adopt_notification', as: :animal_adoption, via: :post
  match :adoption_create, to: 'messages#adoption_create', as: :adoption_create, via: :post

  match :find_friends, to: 'home#find_friends', as: :find_friends, via: :get
  match :find_animals, to: 'home#find_animals', as: :find_animals, via: :get

  match :about, to: 'home#about', as: :about, via: :get

end
