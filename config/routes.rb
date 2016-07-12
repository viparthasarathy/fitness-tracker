Rails.application.routes.draw do
  devise_for :users, :controllers => {sessions: 'sessions'}
  resource :log, only: [:show]
  resources :chapters, only: [:create, :show, :update, :index]
  root 'application#angular'

end
