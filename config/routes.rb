Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # verb '/path', to: 'controller#action'

  # READ ALL
  get '/restaurants', to: 'restaurants#index', as: 'restaurants'

  # CREATE 2 STEPS
  # NEW
  get '/restaurants/new', to: 'restaurants#new', as: 'new_restaurant'
  # CREATE
  post '/restaurants', to: 'restaurants#create'


  # UPDATE
  # Display the form
  get '/restaurants/:id/edit', to: 'restaurants#edit', as: 'edit_restaurant'
  # receive the form
  patch '/restaurants/:id', to: 'restaurants#update'

  # READ ONE
  get '/restaurants/:id', to: 'restaurants#show', as: 'restaurant'
  delete '/restaurants/:id', to: 'restaurants#destroy'
end
