Rails.application.routes.draw do
  devise_for :users, :controllers => {sessions: 'sessions'}
  resource :log, only: [:show]
  resources :chapters, only: [:create, :show, :update, :index]
  resources :entries, only: [:create, :show]
  resources :foods, only: [:create, :update, :destroy]
  resources :measurements, only: [:create, :update]
  get 'chapters/:id/stats', to: 'chapters#stats'
  root 'application#angular'

end
