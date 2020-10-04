Rails.application.routes.draw do
  root to: 'homes#index'
  resource :user, only: %i[new create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
