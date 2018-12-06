Rails.application.routes.draw do
  resources :packages
  resources :sold_properties
  resources :rented_units
  resources :property_units
  resources :properties
  resources :companies
  resources :addresses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
