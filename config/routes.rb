Rails.application.routes.draw do

  root to: "homes#index"
  resource  :users, only:[:new, :create]

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  resources :questions do
    collection do
      get 'edit_select'
    end
  end


end
