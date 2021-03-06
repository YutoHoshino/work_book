Rails.application.routes.draw do

  root to: "homes#index"
  resource  :users, only:[:new, :create]

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  resources :questions do
    resources :question_similars, only:[:new, :create, :destroy]
    collection do
      get 'search'
    end
  end

  resources :tests, only:[:new, :create, :update] do
    collection do
      get 'rank'
    end
  end 
  

end