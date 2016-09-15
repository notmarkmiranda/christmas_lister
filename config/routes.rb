Rails.application.routes.draw do
  root "pages#show"

  get "/dashboard", to: "users#show", as: "dashboard"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
end
