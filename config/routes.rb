Rails.application.routes.draw do
  root 'home#index'
  get 'dashboard', to: "users#index"
  get '/logout', to: "sessions#destroy"
  get '/jane-doe', to: "representatives#show"
  get '/auth/:provider/callback', to: 'sessions#create'
end
