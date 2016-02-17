Rails.application.routes.draw do
  root 'home#index'
  get 'dashboard', to: "users#index"
  get '/jane-doe', to: "representatives#show"
end
