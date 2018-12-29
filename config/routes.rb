Rails.application.routes.draw do
  get "/healthcheck", to: proc { [200, {}, ["OK"]] }
  namespace 'api' do
    resources :operating_statement_fields
    resources :operating_statements
    resources :users
    resources :packages
    resources :sold_properties
    resources :rented_units
    resources :property_units
    resources :properties
    resources :companies
    resources :addresses
    resources :package_sold_properties
    resources :package_rented_units
    post 'authenticate', to: '/api/authentication#authenticate'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
