Rails.application.routes.draw do
  get 'sessions/new'
  root to: "homes#index"
  resource  :user, only:[:new, :create, :show]
end
