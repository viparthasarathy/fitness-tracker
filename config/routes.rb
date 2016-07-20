Rails.application.routes.draw do
  devise_for :users, :controllers => {sessions: 'sessions'}
  resource :log, only: [:show]
  resources :chapters, only: [:create, :show, :update, :index]
  resources :entries, only: [:create, :show]
  resources :foods, only: [:create, :update, :destroy]
  root 'application#angular'

end
