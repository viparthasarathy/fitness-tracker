Rails.application.routes.draw do
  devise_for :users, :controllers => {sessions: 'sessions'}
  resource :log, only: [:show]
  root 'application#angular'

end
