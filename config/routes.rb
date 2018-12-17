Rails.application.routes.draw do
  resources :operating_statement_fields
  resources :operating_statements
  resources :users
  resources :packages
  resources :sold_properties
  resources :rented_units
  resources :property_units
  resources :properties
  resources :companies
  namespace 'api' do
    resources :addresses
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
