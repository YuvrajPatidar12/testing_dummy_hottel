Rails.application.routes.draw do
  resources :rooms
  resources :room_types
  resources :services

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
  
  root "home#index"
  get 'home/index'
  get 'home/profile', to: 'home#profile', as: 'profile'
  get 'about', to: 'home#about'
  get 'home_service', to: 'home#home_service'
  get 'contact', to: 'home#contact'
  post 'contact', to: 'home#process_contact', as: 'process_contact'
  resources :hotels

  namespace :admin do
    resources :dashboard, only: [:index]
  end
  namespace :manager do
    resources :dashboard, only: [:index]
  end
  namespace :customer do
    resources :dashboard, only: [:index]
  end
end
