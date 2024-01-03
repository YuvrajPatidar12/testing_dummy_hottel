Rails.application.routes.draw do
  # namespace :customer do
  #   get 'dashboard/index'
  # end
  # namespace :manager do
  #   get 'dashboard/index'
  # end
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
  get 'service', to: 'home#service'
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
