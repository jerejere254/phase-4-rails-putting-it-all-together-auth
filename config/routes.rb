Rails.application.routes.draw do
      resources :tourist
      resources :tourguides
      resources :sites
      
  post '/signup', to: "tourists#create"
  get "/me", to: "tourists#show"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get '/tourists', to: "touristss#index"
  post '/to', to: "tourists#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end