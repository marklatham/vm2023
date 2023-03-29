Rails.application.routes.draw do
  devise_for :admin_users, :skip => :registration
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#home"

  resources :clippings
  resources :links
  resources :presentations
  resources :proposals
  resources :pubs
  resources :videos

  get "/about", to: "home#about", as: "about"
  get "/search", to: "home#search", as: "search"

end
