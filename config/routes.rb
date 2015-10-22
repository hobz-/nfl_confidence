Rails.application.routes.draw do

  devise_for :users
  resources :weeks, only:[:show, :index, :new, :create]
  resources :picks, only:[:create]
  resources :users, only:[:index]

  root 'static_pages#index'

end
