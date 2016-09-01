Rails.application.routes.draw do
  root to: "home#index"
  
  get 'dashboard', to: "users#show"
  get '/auth/github', as: :login
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout', to: "sessions#destroy"
end
