# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
  resources :products

  # basket 
  get "basket", to: "basket#index"
  post "basket", to: "basket#create"
  delete "basket", to: "basket#destroy"
end
