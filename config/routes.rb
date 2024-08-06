Rails.application.routes.draw do
  resources :subcategories
  resources :categories
  get 'cart', to: 'cart#show' 
  post 'cart/add'
  post 'cart/show'
  post 'cart/remove'
  post 'cart/plusOne'
  post 'cart/minusOne'

  resources :products

  root 'products#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
