Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "new", to: "games#new"
  get "score", to: "games#score"
  # root "articles#index"
end
