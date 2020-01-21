Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :users
      resources :games
      resources :sessions, only: [:create, :destroy]
      root to:'static#home'
    end
  end


end
